var socket = io();
socket.on("load", function(model_l) { // load用関数.model_lにデータを格納
    model = model_l;
    for(var i in model){
	makeDetails(model, i, i, "main"); // Detailを作る関数を呼ぶ。treeを作る
    } 
});

socket.on("change", function(end) { 
	// don't enything
}); 


function submitModel(modelName){
    socket.emit("load", modelName); // emlをloadする
    document.getElementById("modelS").innerHTML = "";
    document.getElementById("simulation").style.display = "inline";
    
}

socket.on("step", function(model_l){ // stepを回す関数
    setValueAll(model_l); 
});

function setValueAll(model_l){ // step回したあとのValue変更用関数
    model = merge($.extend(true,{},model_l), model); 
    for (var key in nameList){
        setValue(nameList[key]);
    }
    document.getElementById("timeout").value = model.time[model.time.length - 1];
    //addTime = model_l.time;
    //timeData();
    viewGraph(lookingVal, lookingFlag, model_l);
    simulation();
}

function merge(obj1, obj2) {
    if(obj1 === Object(obj1)) {
        for(var key in obj1) {
            if((key === "Activity" || key === "Velocity" || key === "Value" || key === "time") && is("Array",obj1[key])) {
                obj1[key] = obj2[key].concat(obj1[key]);
            } else {
                merge(obj1[key], obj2[key]);
            }
        }
    }
    return obj1;
}

//型判定用の関数
function is(type, obj) {
    var clas = Object.prototype.toString.call(obj).slice(8, -1);
    return obj !== undefined && obj !== null && clas === type;
}

/*
function merge(obj1, obj2) {
    if(obj1 === Object(obj1)) {
        for(var key in obj1) {
            if(key === "Activity" || key === "Velocity" || key === "Value" || key === "time") {
                obj1[key] = obj1[key].concat(obj2[key]);
            } else {
                merge(obj1[key], obj2[key]);
            }
        }
    }
    return obj1;
}*/

// gloval variable
var model = {};
var nameList = []; // 変数のkeyが入ったlist
var numA = 0;
var numB = 0;
var returnVal = {};

// tree構造を作る関数
function makeDetails(obj, key, id, parent){
    if(id == "root"){
	id = "/";
    }
    if(obj[key] != null && key != "time"){
	var parentObj = document.getElementById(parent);
	var details = document.createElement("details");
	details.setAttribute("id", id);
	if(id == "/"){
	    details.setAttribute("open", "open");
	}
	parentObj.appendChild(details);
	parentObj = document.getElementById(id);
	
	if(key == "root"){
	    parentObj.innerHTML += "<summary>/</summary>";
	}else{
	    parentObj.innerHTML += "<summary>" + key + "</summary>";
	}
	
	var dd = document.createElement("dd");
	var ddName = "dd" + numB;
	dd.setAttribute("id", ddName);
	numB += 1;
	parentObj.appendChild(dd);
	parentObj = document.getElementById(ddName);
	
	for(i in obj[key]){
	    var dl = document.createElement("dl");
	    var path;
	    if(id == "/"){
		path = id + i;
	    }else{
		path = id + "/" + i;
	    }
	    var name = "dl" + numA;
	    dl.setAttribute("id", name);
	    numA += 1;
	    parentObj.appendChild(dl);
	    if(key == "Variable" || key == "Process"){
		makeValue(obj[key], key, i, path, name);
	    }else{
		makeDetails(obj[key], i, path, name);
	    }
	}
    }
}

// セレクターを作る関数
function makeValue(obj, flag, key,  id, parent){
    var graph = 0
    if(key != null){
	var parentObj = document.getElementById(parent);
	parentObj.innerHTML = "<div id='div:" + id + "' style='display:inline-block; width:30%; overflow:scrole;' onclick='viewGraph(\"" + id + "\", \"" + flag + "\", \"none\")'>" + key + "</div>";
	var formId = flag + ":" + id;
	var inp = "<form onsubmit='changeValue(\"" + formId + "\"); return false;' style='display:inline-block;'>";
	inp += "<select id='select:" + formId + "' onchange='setValue(\"" + formId + "\")' style='width: 145px;'>";

	for(var i in obj[key]){
	    if( is( "Array", obj[key][i] ) && i != "VariableReferenceList" ){
		graph = 1
	    }
	    if(i == "Value"){
		inp += "<option value='" + i + "' selected='selected'>" + i + "</option>";
	    }else{
		inp += "<option value='" + i + "'>" + i + "</option>";
	    }
            // nameList.push(formId + "/" + i); // 変数のkeyが入ったlist
            nameList.push(formId); // 変数のkeyが入ったlist
	}
	if( graph == 1 ){
	    parentObj.innerHTML = "<div id='div:" + id + "' style='color:red; display:inline-block; width:30%; overflow:scrole;' onclick='viewGraph(\"" + id + "\", \"" + flag + "\", \"none\")'>" + key + "</div>";
	} else {
	    parentObj.innerHTML = "<div id='div:" + id + "' style='display:inline-block; width:30%; overflow:scrole;'>" + key + "</div>";
	}
	inp += "</select><input type='text' id='" + formId + "'></form>";
	parentObj.innerHTML += inp;
        // id_lists.push(formId);
	setValue(formId);
    }
}

// Valueを入れる関数
function setValue(name){
    var value = document.getElementById("select:" + name).value;
    var valueKeys = name.split("/");
    valueKeys.splice(0, 1);
    var obj = model["root"];
    for(var i = 0; i < valueKeys.length; i++){
	obj = obj[valueKeys[i]];
    }
    if( is("Array", obj[value]) && value != "VariableReferenceList" ){
   	document.getElementById(name).value = obj[value][obj[value].length - 1];	
    }else{
    	document.getElementById(name).value = obj[value];
    }
    if(value == "Value" || value == "Fixed"){
	document.getElementById(name).disabled = false;
    }else{
	document.getElementById(name).disabled = true;
    }
}


// Valueを変更する関数
function changeValue(name){
    var value = document.getElementById("select:" + name).value;
    var valueKeys = name.split("/");
    valueKeys.splice(0, 1);
    var obj = model["root"];
    var path = "root.";
    for(var i = 0; i < valueKeys.length; i++){
	obj = obj[valueKeys[i]];
	path += valueKeys[i] + ".";
    }
    //obj[value][0] = Number(document.getElementById(name).value);
    path += value;
    //console.log( obj[value][0] );
    //returnVal[path] = obj[value][0];
    //console.log(obj[value][0])
    socket.emit("change",[path, Number(document.getElementById(name).value)]) 
}



// グラフ描画
var x_range = [0, 10];
var y_range = [0, 100];
var timeList = [0];
var viewValues = [];

var x_top = 10;
var y_top = 100;
var y_bottom = 0;

var redbull = [];
var lookingVal = "";
var lookingFlag = "";
var addTime = [];
var lc;
var data;

function timeData(){
    // runの時の時間を調節できるようにする。
    console.log(addTime);
    for (var i = 0; i < interval; i++){
        timeList.push(i + 1);
    }
}

var viewFlag = false;
function viewGraph(id, flag, model_l){
    if(lookingVal == ""){
        if(viewFlag == false){
	    document.getElementById("div:" + id).style.backgroundColor = "#FFA07A";
        }
    }else{
	document.getElementById("div:" + lookingVal).style.backgroundColor = "#f8f8f8";
	document.getElementById("div:" + id).style.backgroundColor = "#FFA07A";
    }
    lookingVal = id;
    lookingFlag = flag;
    var valueKeys = id.split("/");
    if(model_l === "none" || connect_num == 1){
        var obj = model["root"];	
	redbull = []	
    } else {
	var obj = model_l["root"];
    }
    for(var i = 1; i < valueKeys.length; i++){
	obj = obj[valueKeys[i]];
    }
    if(flag == "Variable"){
	viewValues = obj["Value"];
    }else{
	viewValues = obj["Activity"];
    }
    //console.log(model_l)
    makeGraph(model_l);
}


function makeData(a, b, bull){
    var x_b = a;
    var y_b = b;
    var time_len = x_b.length;
    /*if(sim_style == "run"){
       
    }else if(sim_style == "step"{
    }*/
    for(var i = 0; i < time_len; i++){
	bull.push({x:x_b[i], y: y_b[i]});
    }
}


function makeGraph(model_l){
    if(lookingVal != ""){
        //viewGraph(lookingVal, lookingFlag);
	//makeData(timeList, viewValues);
    	//document.getElementById("timeout").value = model.time[model.time.length - 1];
	if(model_l === "none" || connect_num == 1){
	   document.getElementById("graph").innerHTML = "";
	   makeData(model.time, viewValues, redbull);
           data = {
	      name: 'points',
	      values: redbull
	   };
	   console.log($("#graph").height())
	   lc = new LineChart({
	       parent: '#graph',
	       graph_width: 0.99 * $("#graph").width(),
	       graph_height: 9 / 16 * 0.99 * $("#graph").width()
 	   });
	   lc.all_series  = [data];
	}else{
	   lc.all_series = [data];
	   makeData(model_l.time, viewValues, lc.all_series[0].values)
	   //console.log(model_l.time);
	   //console.log(viewValues);
	}
	lc.plot();
    }
}


var time = 0;
var step_num = 0;
var start_time = 0;
var interval = 10;
var sim_style;
var connect_num = 0;
var start_time = 0;
var thining = 1;

function strt(style){
    start_time = model.time[model.time.length - 1]
    step_num = 0;
    interval =  Number(document.getElementById("interval").value);
    sim_style = style; 
    time    = Number(document.getElementById("timeInp").value);
    thining = Number(document.getElementById("thining").value); 
    simulation();
    viewFlag = true;
    // runSim();
}
/*
function simulation(){
    if(sim_style == "run"){
	while( model.time[model.time.length - 1] < time){
            runSim();
	}
    }else if(sim_style == "step"){
        while(step_num < time){
            runSim();
        }
    }
}
*/
function simulation(){
    // console.log(model.time.length);
    if(sim_style == "run"){
	if(model.time[model.time.length - 1] - start_time < time){
            runSim();
	}else{
	    time = 0;
	    start_time = model.time[model.time.length - 1]
	}
    }else if(sim_style == "step"){
        if(step_num < time){
	    if( time - step_num < interval ){
		interval = time - step_num
            	runSim();
	    }else{
	    	runSim();
	    }
        }else{
	    step_num = 0;
	}
    }
}

function runSim(){
    step_num += interval;
    connect_num += 1;
    socket.emit("step", [interval,thining]);
}

/*
function runSim(){
    while(step_num < time){
        step_num += interval;
        socket.emit("step", interval);
    }
}*/
