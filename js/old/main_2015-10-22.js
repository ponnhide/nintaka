var socket = io();

// load用関数.model_lにデータを格納するソケット
socket.on("load", function(model_l) { 
    console.log(model_l);
    model = model_l;
    for(var i in model){
	    makeDetails(model, i, i, "main"); // Detailを作る関数を呼ぶ。treeを作る
    } 
});

// stepを回すソケット
socket.on("step", function(model_l){ 
    setValueAll(model_l); 
});

// 変更した値をPythonに送るソケット
socket.on("change", function(end) { 
    // don't enything
});

// モデル名がクリックされた時に動く関数
function submitModel(modelName){
    socket.emit("load", modelName); // emlをloadする
    document.getElementById("modelDiv").innerHTML = "";
    document.getElementById("simulation").style.display = "inline";
}

// step回したあとのValue変更用関数
function setValueAll(model_l){ 
    model = merge($.extend(true,{},model_l), model); //深いコピーをしないとmodel_lの構造が変わってしまう． 
    for (var key in nameList){
        setValue(nameList[key]);
    }
    document.getElementById("timeout").value = model.time[model.time.length - 1];
    viewGraph(lookingVal, lookingFlag, model_l);
    simulation();
}

// オブジェクトmerge関数
function merge(obj1, obj2) {
    var kayo = 0;
    if(obj1 === Object(obj1)) {
        for(var key in obj1) {
            if((key === "Activity" || key === "Velocity" || key === "Value" || key === "time") && is("Array", obj1[key])){
                obj1[key] = obj2[key].concat(obj1[key]);
                // データの長さを調節
                if(obj1[key].length > valLen){
                    obj1[key].splice(0, obj1[key].length - valLen); 
                }
            } else {
                merge(obj1[key], obj2[key]);
            }
        }
    }
    return obj1;
}

// 型判定用の関数
function is(type, obj) {
    // Array, Object, Number, String
    var clas = Object.prototype.toString.call(obj).slice(8, -1);
    return obj !== undefined && obj !== null && clas === type;
}


// gloval variable
var model = {}; // modelを格納するobject
var nameList = []; // 変数のkeyが入ったlist
var numA = 0; // dlのナンバリング用 
var numB = 0; // ddのナンバリング用 
var valLen = 100000; // 保存しておくデータの長さ

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
                makeValue(obj[key], key, i, path, name); // セレクターを作成する関数を呼ぶ
            }else{
                makeDetails(obj[key], i, path, name); // 再帰
            }
        }
    }
}

// セレクターを作る関数
function makeValue(obj, flag, key,  id, parent){
    var graph = 0;
    if(key != null){
        var parentObj = document.getElementById(parent);
        var formId = flag + ":" + id;
        var inp = "<form onsubmit='changeValue(\"" + formId + "\"); return false;' style='display:inline-block;'>";
        inp += "<select id='select:" + formId + "' onchange='setValue(\"" + formId + "\")' style='width: 145px;'>";

        for(var i in obj[key]){
            if(is("Array", obj[key][i]) && i !="VariableReferenceList"){
                graph = 1; // 配列で返ってきて、なおかつVariableReferenceListじゃない場合はグラフ化できる
            }
            if(i == "Value"){
    	        inp += "<option value='" + i + "' selected='selected'>" + i + "</option>";
            }else{
    	        inp += "<option value='" + i + "'>" + i + "</option>";
            }
            nameList.push(formId); // 変数のkeyが入ったlist
        }
        if(graph == 1){ // グラフ化できるものは文字を赤色に表示
            parentObj.innerHTML = "<div id='div:" + id + "' style='color:red; display:inline-block; width:30%; overflow:scrole;' onclick='viewGraph(\"" + id + "\", \"" + flag + "\", \"none\")'>" + key + "</div>";
        }else{ // それ以外は黒
            parentObj.innerHTML = "<div id='div:" + id + "' style='display:inline-block; width:30%; overflow:scrole;'>" + key + "</div>";
        }
        inp += "</select><input type='text' id='" + formId + "'></form>";
        parentObj.innerHTML += inp;
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
    if(is("Array", obj[value]) && value != "VariableReferenceList"){
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
    path += value;
    socket.emit("change", [path, Number(document.getElementById(name).value)]);
}



// グラフ描画
var x_range = [0, 10];
var y_range = [0, 100];
var timeList = [0];
var viewValues = [];

var x_top = 10;
var y_top = 100;
var y_bottom = 0;
var time_len = 1000;

var redbull = [];
var lookingVal = "";
var lookingFlag = "";
var addTime = [];
var lc;
var data;
var viewFlag = false;

// 時間データの調節用関数
function timeData(){
    console.log(addTime);
    for (var i = 0; i < interval; i++){
        timeList.push(i + 1);
    }
}

// グラフ確認用関数
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
        redbull = [];
    }else{
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
    makeGraph(model_l);
}


function makeData(a, b, bull){
    var x_b = a;
    var y_b = b;
    var time_len = x_b.length;
    for(var i = 0; i < time_len; i++){
        bull.push({x:x_b[i], y: y_b[i]});
    }
}


function makeGraph(model_l){
    if(lookingVal != ""){
        if(model_l === "none" || connect_num == 1){
            document.getElementById("graph").innerHTML = "";
            makeData(model.time, viewValues, redbull);
                data = {
                    name: 'points',
                    values: redbull
                };
            
        //ここで現在のdivの大きさに合わせてグラフ作成森
	    lc = new LineChart({
                parent: '#graph',
		graph_width: 0.99 * $("#graph").width(),
                graph_height: 9 / 16 * 0.99 * $("#graph").width()
            });
            lc.all_series  = [data];
        }else{
            lc.all_series = [data];
            makeData(model_l.time, viewValues, lc.all_series[0].values);
        }
    lc.plot();
    }
}


// simulation用 gloval変数
var time = 0;
var step_num = 0;
var start_time = 0;
var interval = 100; //100ぐらいでいいと思う！森
var sim_style;
var connect_num = 0;
var thining = 1;
var judge = {"time": false, "interval": false, "thining": false};

// simulationを始める関数. runやstepが押された時にこれが動く
function strt(style){
    var runbtn = document.getElementById("runbtn");
    var stepbtn = document.getElementById("stepbtn");
    step_num = 0;
    if(document.getElementById("interval").value > 0 && document.getElementById("interval").value.match(/^-?[0-9]+$/)){ // intervalのinputが正の整数の時
       interval = document.getElementById("interval").value;
       judge.interval = true;
    }
    if(document.getElementById("timeInp").value > 0 && document.getElementById("timeInp").value.match(/^-?[0-9]+$/)){ // timeのinputが正の整数の時
       time = document.getElementById("timeInp").value;
       judge.time = true;
    }
    if(document.getElementById("thining").value > 0 && document.getElementById("thining").value.match(/^-?[0-9]+$/)){ // thiningのinputが正の整数の時
       thining = document.getElementById("thining").value;
       judge.thining = true;
    }
    sim_style = style; // "run" or "step"
    if(judge.time && judge.interval && judge.thining){ // 全て正しい値が入力されている場合
        start_time = model.time[model.time.length - 1];
        simulation();
        viewFlag = true;
        runbtn.disabled = true;
        stepbtn.disabled = true;
    }else{
        alert("正しい値を入力してください");
    }
    for(var i in judge){
        judge[i] = false;
    }
}

// simulationを動かす関数
function simulation(){
    var runbtn = document.getElementById("runbtn");
    var stepbtn = document.getElementById("stepbtn");
    if(sim_style == "run"){
        if(model.time[model.time.length - 1] - start_time < time){
            runSim();
        }else{
            time = 0;
            start_time = model.time[model.time.length - 1];
            runbtn.disabled = false;
            stepbtn.disabled = false;
        }
    }else if(sim_style == "step"){
        if(step_num < time){
            if(time - step_num < interval){
                interval = time - step_num;
            }
            runsim()
        }else{
            step_num = 0;
            runbtn.disabled = false;
            stepbtn.disabled = false;
        }
    }
}

// simのリクエストを送る用の関数
function runSim(){
    step_num += interval;
    connect_num += 1;
    socket.emit("step", [interval, thining]);
}

