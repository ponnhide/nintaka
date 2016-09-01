/*
	# D3.jsからのベタ書きに変更
	# runした時、終わりの時間を調整
	# 500秒ごとにグラフが切り替わる
*/

var socket = io();

// graphのDivサイズを調節する関数
function graphdiv_change(){
	var divW = document.getElementById("graph").clientWidth;
	var divH = divW * 5 / 9;
	document.getElementById("graph").style.height = divH + "px";
}

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
init();
function init(){
    var modelName = localStorage.getItem("modelName");
	socket.emit("load", modelName); // emlをloadする
	document.getElementById("modelName").textContent = modelName;
	document.getElementById("simulation").style.display = "inline";
	graphdiv_change();
}

// step回したあとのValue変更用関数
function setValueAll(model_l){
	model = merge($.extend(true,{},model_l), model); //深いコピーをしないとmodel_lの構造が変わってしまう．
	for (var key in nameList){
		setValue(nameList[key]);
	}
	if(sim_style == "step"){
		document.getElementById("timeout").value = model.time[model.time.length - 1];
	}else if(sim_style == "run"){
		if(end_time > model.time[model.time.length - 1]){
			document.getElementById("timeout").value = model.time[model.time.length - 1];
		}else{
			document.getElementById("timeout").value = start_time + time;
		}
	}else if(sim_style == "auto"){
		document.getElementById("timeout").value = model.time[model.time.length - 1];
	}
	viewGraph(lookingVal, lookingFlag, model);
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
				// if(obj1[key].length > dataLen){
				// 	obj1[key].splice(0, obj1[key].length - dataLen);
				// }
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
var dataLen = 50000; // 保存しておくデータの長さ

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
var timeList = [0];
var viewValues = [];
var time_len = 1000;
var redbull; // データ
var lookingVal = "";
var lookingFlag = "";
var addTime = [];
var data;
var viewFlag = false;
var xS = 0;
var xs = 0;
var xL = 0;

// 時間データの調節用関数
function timeData(){
	// console.log(addTime);
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
	makeGraph();
}


function makeData(a, b){
	var x_b = a;
	var y_b = b;
	var time_len = x_b.length;
	var bull = [];
	for(var i = 0; i < time_len; i += 2){
		if(xs <= x_b[i] && end_time > x_b[i]){
			if(end_time < x_b[i + 1]){
				bull.push({"x": end_time, "y": y_b[i]})
			}else{
				bull.push({"x": x_b[i], "y": y_b[i]});
			}
		}
	}
	return bull;
}

function setScale(dataset){
	if(xS == 0 && step_num != 1){
		xL = Math.floor((model.time[model.time.length - 1] - model.time[0])) * model.time.length / 10;
		xS += xL;
	}else if(xS != 0){
		while(xS < d3.max(dataset, function(d){ return d.x })){
	        xS += xL;
			xs += xL;
	    }
	}
}

function makeLinechart(dataset){
	var divW = document.getElementById("graph").clientWidth,
		divH = document.getElementById("graph").clientHeight;

    var margin = {top: 20, right: 100, bottom: 50, left: 100},
        width = divW - margin.left - margin.right,
        height = divH - margin.top - margin.bottom;

    var svg = d3.select("#graph").append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var xScale = d3.scale.linear()
        .domain([xs, xS])
        .range([5, width]);

    var yScale = d3.scale.linear()
        .domain([d3.min(dataset, function(d){ return d.y }), d3.max(dataset, function(d){ return d.y; })])
        .range([height, 0]);

    var xAxis = d3.svg.axis()
        .scale(xScale)
        .orient("bottom");

    var yAxis = d3.svg.axis()
        .scale(yScale)
        .orient("left");

    var line = d3.svg.line()
        .x(function(d) { return xScale(d.x); })
        .y(function(d) { return yScale(d.y); });

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis);

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis);

    svg.append("path")
        .datum(dataset)
        .attr("class", "line")
        .attr("d", line);
}



function makeGraph(){
	document.getElementById("graph").innerHTML = "";
	if(lookingVal != ""){
		setScale(redbull);
		redbull = makeData(model.time, viewValues);
		makeLinechart(redbull);
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
var judge = {"time": false, "interval": false};
var end_time = 0;
var run_flag = false;

// simulationを始める関数. runやstepが押された時にこれが動く
function strt(style){
	var runbtn = document.getElementById("runbtn");
	var stepbtn = document.getElementById("stepbtn");
	var autobtn = document.getElementById("autobtn");
	var stopbtn = document.getElementById("stopbtn");
	step_num = 0;
	if(document.getElementById("interval").value > 0 && document.getElementById("interval").value.match(/^-?[0-9]+$/)){ // intervalのinputが正の整数の時
		interval = Number(document.getElementById("interval").value);
		judge.interval = true;
	}
	if(document.getElementById("timeInp").value > 0 && document.getElementById("timeInp").value.match(/^-?[0-9]+$/)){ // timeのinputが正の整数の時
		time = Number(document.getElementById("timeInp").value);
		judge.time = true;
	}
	// if(document.getElementById("thining").value > 0 && document.getElementById("thining").value.match(/^-?[0-9]+$/)){ // thiningのinputが正の整数の時
	// 	thining = document.getElementById("thining").value;
	// 	judge.thining = true;
	// }
	sim_style = style; // "run" or "step" or "auto"
	if(judge.time && judge.interval){ // 全て正しい値が入力されている場合
		viewFlag = true;
		runbtn.disabled = true;
		stepbtn.disabled = true;
		autobtn.disabled = true;
		stopbtn.disabled = false;
		if(sim_style == "auto"){
			run_flag = true;
			time = 10000;
		}
		end_time = start_time + time;
		simulation();
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
	var autobtn = document.getElementById("autobtn");
	var stopbtn = document.getElementById("stopbtn");
	if(sim_style == "run"){
		if(model.time[model.time.length - 1] - start_time < time){
			runSim();
		}else{
			time = 0;
			// start_time = model.time[model.time.length - 1];
			makeGraph();
			start_time = end_time;
			runbtn.disabled = false;
			stepbtn.disabled = false;
			autobtn.disabled = false;
			stopbtn.disabled = true;
		}
	}else if(sim_style == "auto"){
		if(run_flag == true){
			if(model.time[model.time.length - 1] > end_time){
				end_time = end_tiem + time;
			}
			runSim();
		}else{
			time = 0;
			makeGraph();
			start_time = Math.floor(model.time[model.time.length - 1]);
			runbtn.disabled = false;
			stepbtn.disabled = false;
			autobtn.disabled = false;
			stopbtn.disabled = true;
		}
	}else if(sim_style == "step"){
		if(step_num < time){
			if(time - step_num < interval){
				interval = time - step_num;
			}
			runSim();
		}else{
			step_num = 0;
			time = 0;
			makeGraph();
			start_time = Math.floor(model.time[model.time.length - 1]); // 変更 10/27
			runbtn.disabled = false;
			stepbtn.disabled = false;
			autobtn.disabled = false;
			stopbtn.disabled = true;
		}
	}
}

function stop_sim(){ // stopボタンをおした時
	if(sim_style == "auto"){
		run_flag = false;
	}
	else if(sim_style == "run"){
		time = model.time[model.time.length - 1] - start_time;
		end_time = start_time + time;
	}else if(sim_style == "step"){
		time = step_num;
		end_time = start_time + time;
	}
	document.getElementById("stopbtn").disabled = true;

}

// simのリクエストを送る用の関数
function runSim(){
	step_num += interval;
	connect_num += 1;
	socket.emit("step", [interval, thining]);
}
