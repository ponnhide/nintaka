var socket = io();
socket.on("load", function(model_l) {
    console.log("hoge")
    model = model_l;
    for(var i in model){
	makeDetails(model, i, i, "tree");
    } 
});

socket.on("step", function(newobj){
    setValueAll(newobj);
});

function submitModel(modelName){ 
    socket.emit("load", modelName);
    document.getElementById("models").style.display = "none";
    document.getElementById("simulation").style.display = "inline-block"; 
}


function setValueAll(model_l){ // step回したあとのValue変更用関数
    model = merge(model, model_l); 
    // console.log(model);
    for (var key in nameList){
        setValue(nameList[key]);
    }
    timeData();
    //makeGraph();
    viewGraph(lookingVal, lookingFlag);
    simulation();
}

function merge(obj1, obj2) {
    if(obj1 === Object(obj1)) {
        for(var key in obj1) {
            if( key == "time" || key === "Activity" || key === "Velocity" || key === "Value") {
                //console.log(key);
                obj1[key] = obj1[key].concat(obj2[key]);
            } else if(is("Object",obj1[key])) {
		obj1[key] = obj2[key];
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
    if(obj[key] != null){
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
    if(key != null){
	var parentObj = document.getElementById(parent);
	parentObj.innerHTML = "<div id='div:" + id + "' style='display:inline-block; width:30%; overflow:scrole;' onclick='viewGraph(\"" + id + "\", \"" + flag + "\")'>" + key + "</div>";
	var formId = flag + ":" + id;
	
	var inp = "<form onsubmit='changeValue(\"" + formId + "\"); return false;' style='display:inline-block;'>";
	inp += "<select id='select:" + formId + "' onchange='setValue(\"" + formId + "\")' style='width: 145px;'>";

	for(var i in obj[key]){
	    if(i == "Value"){
		inp += "<option value='" + i + "' selected='selected'>" + i + "</option>";
	    }else{
		inp += "<option value='" + i + "'>" + i + "</option>";
	    }
            // nameList.push(formId + "/" + i); // 変数のkeyが入ったlist
            nameList.push(formId); // 変数のkeyが入ったlist
	}
	inp += "</select><input type='text' id='" + formId + "'></form>";
	parentObj.innerHTML += inp;
        // id_lists.push(formId);
	setValue(formId);
    }
}

// Valueを入れる関数

function setValue(name){
    //console.log(name); 
    var value = document.getElementById("select:" + name).value;
    var valueKeys = name.split("/");
    valueKeys.splice(0, 1);
    var obj = model["root"];
    for(var i = 0; i < valueKeys.length; i++){
	obj = obj[valueKeys[i]];
    }
    //console.log( obj[value] )
    if(is("Array", obj[value]) && value != "VariableReferenceList"){
    	document.getElementById(name).value = obj[value][obj[value].length - 1];
    }else{
    	document.getElementById(name).value = obj[value];
    }

    if(value == "Value"){
	document.getElementById(name).disabled = false;
    }else{
	document.getElementById(name).disabled = true;
    }    
}

function changeValue(name){
    var value = document.getElementById("select:" + name).value;
    var valueKeys = name.split("/");
    valueKeys.splice(0, 1);
    var obj = model["root"];
    var path = "root/";
    for(var i = 0; i < valueKeys.length; i++){
	obj = obj[valueKeys[i]];
	path += valueKeys[i] + "/";
    }
    obj[value] = document.getElementById(name).value;
    path += value;
    returnVal[path] = obj[value][0];
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


function timeData(){
    // timeList = timeList.concat(model["time"]);
    var si = timeList[timeList.length - 1];
    for (var i = 0; i < interval; i++){
        timeList.push(si + i + 1);
    }
}


function viewGraph(id, flag){
    if(lookingVal == ""){
	document.getElementById("div:" + id).style.backgroundColor = "#FFA07A";
    }else{
	document.getElementById("div:" + lookingVal).style.backgroundColor = "#f8f8f8";
	document.getElementById("div:" + id).style.backgroundColor = "#FFA07A";
    }
    lookingVal = id;
    lookingFlag = flag;
    var valueKeys = id.split("/");
    var obj = model["root"];
    for(var i = 1; i < valueKeys.length; i++){
	obj = obj[valueKeys[i]];
    }
    if(flag == "Variable"){
	viewValues = obj["Value"];
    }else{
	viewValues = obj["Activity"];
    }
    
    makeGraph();
}


function makeData(a, b){
    redbull = [];
    var x_b = a;
    var y_b = b;
    for(var i = 0; i < x_b.length; i++){
	redbull.push({x:x_b[i], y: y_b[i]});
    }
}


function makeGraph(){
    document.getElementById("graph").innerHTML = "";
    if(lookingVal != ""){
        // viewGraph(lookingVal, lookingFlag);
	makeData(timeList, viewValues);
	var data = {
	    name: 'points',
	    values: redbull
	};
	var lc = new LineChart({
	    parent: '#graph'
	});
	lc.all_series = [data];
	lc.plot();
    }
}

var time = 0;
var sim_time = 0;
var interval = 2;
function start(style){
    sim_time = 0;
    sim_style = style;
    pos = 1;
    
    sim_time = document.getElementById("timeInp").value;
    simulate();
}

var sim_style;
function simulation(){
    if(sim_style == "run"){
	if(noko[noko.length - 1] < time){
            simulate();
	}
    }else if(sim_style == "step"){
	simulate();
    }
}

function simulate(){
    //sim_time = document.getElementById("timeInp").value;
    if(sim_time > 0 ){ 
    	if(sim_time < interval){
            socket.emit("step", sim_time);
	    sim_time = 0;
	    document.getElementById("timeInp").value = sim_time; 
        }else{
            socket.emit("step", interval);
            sim_time = sim_time - interval;
	    document.getElementById("timeInp").value = sim_time; 
        }
    }
}
function changetab(tagid){
	var tabs = ["models","log","simulation"]
	for( var i = 0; i < 3; i++ ){
      	    if( tabs[ i ] == tagid ){
	        document.getElementById( tagid ).style.display = 'block'; 
	    }else{
	    	document.getElementById( tabs[i] ).style.display = 'none';
	    }	       
	}
	if(tagid == "models"){
		model = {}
		document.getElementById("tree").innerHTML = "";
	        socket.emit("reopen",[]); 	
		console.log("reconnect");
		location.reload(); //連続でloadするとうまくいかないので，，
	}
}

