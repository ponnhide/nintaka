/*
 *   # D3.jsからのベタ書きに変更
 *   # runした時、終わりの時間を調整
 *   # 500秒ごとにグラフが切り替わる
 */

var socket = io(); 
var discription = null; 
var property_sub_number = 0;

// graphのdivサイズを調節する関数
function graphdiv_change(){
    var divW = document.getElementById("graph").clientWidth;
    var divH = divW * 9 / 16;
    document.getElementById("graph").style.height = divH + "px";
}

// load用関数.model_lにデータを格納するソケット
socket.on("load", function(model_l) {
    connect_num += 1;
    model = model_l;
    discription = model["discription"]
    for(var i in model){
        makeDetails(model, i, i, "main"); // Detailを作る関数を呼ぶ。treeを作る
    }
    console.log(nameList);
    changeTab("discripbtn","discription", 0);
});

// stepを回すソケット
socket.on("step", function(model_l){
    setValueAll(model_l);
});

// 変更した値をPythonに送るソケット
socket.on("change", function(end) {
    // don't enything
});

// ページをロードした時に動く関数
function init(){
    document.getElementById("discription").style.display = "none";
    var modelName = localStorage.getItem("modelName");
    var modelType = localStorage.getItem("modelType");
    socket.emit("load", [modelName, modelType]); // emlをloadする
    document.getElementById("modelName").textContent = modelName;
    document.getElementById("simulation").style.display = "inline";
    document.getElementById("history").style.display = "none";
    document.getElementById("strip").style.display = "none";
}

// step回したあとのValue変更用関数
function setValueAll(model_l){
    /*
     * model_l : socketを回して返ってきた値(Object)
     * 
     *
     */
    merge(model, $.extend(true, {}, model_l)); //深いコピーをしないとmodel_lの構造が変わってしまう．
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
    //グラフを描画する回数を間引いた方が効果的？
    viewGraph(lookingVal, lookingFlag, model);
    simulation();
}

// オブジェクトmerge関数
function merge(obj1, obj2) {
    if(obj1 === Object(obj1)) {
        for(var key in obj1) {
            if((key === "Activity" || key === "Velocity" || key === "Value" || key === "time") && is("Array", obj2[key])){
                Array.prototype.push.apply(obj1[key],obj2[key])
            }else{
                if(is("Object",obj1[key])){
                    merge(obj1[key], obj2[key]);
                }else{
                    obj1[key] = obj2[key];
                }
            }
        }
    }
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
    if(obj[key] != null && key != "time" && key != "discription"){ //新しくdiscrptionを加えました
        var parentObj = document.getElementById(parent);
        var details = document.createElement("details");
        details.setAttribute("id", id);
        if(id.split("/").length < 3){ // 森
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
    // var graph = 0;
    if(key != null){
        var parentObj = document.getElementById(parent);
        var formId = flag + ":" + id;
        var inp = "<form onsubmit='changeValue(\"" + formId + "\",0); return false;' style='display:inline-block;'>";
        inp += "<select id='select:" + formId + "' onchange='setValue(\"" + formId + "\")' style='width: 145px;'>";

        for(var i in obj[key]){
            // if(is("Array", obj[key][i]) && i !="VariableReferenceList"){
            //     graph = 1; // 配列で返ってきて、なおかつVariableReferenceListじゃない場合はグラフ化できる
            // }
            if(i == "Value"){
                inp += "<option value='" + i + "' selected='selected'>" + i + "</option>";
            }else{
                inp += "<option value='" + i + "'>" + i + "</option>";
            }
            if(nameList.indexOf(formId) == -1){ // nameListにformIdがなかったら
                nameList.push(formId); // 変数のkeyが入ったlist
            }
        }
        // if(graph == 1){ // グラフ化できるものは文字を赤色に表示
        //     parentObj.innerHTML = "<div class=\"graphable\" id='div:" + id + "' style='display:inline-block; width:29%; overflow:scrole;' onclick='viewGraph(\"" + id + "\", \"" + flag + "\", \"none\")'>" + key + "</div>";
        // }else{ // それ以外は黒
        //     parentObj.innerHTML = "<div class=\"static\" d='div:" + id + "' style='display:inline-block; width:29%; overflow:scrole;'>" + key + "</div>";
        // }
        parentObj.innerHTML = "<div class=\"graphable\" id='div:" + id + "' style='display:inline-block; width:29%; overflow:scrole;' onclick='viewGraph(\"" + id + "\", \"" + flag + "\", \"none\")'>" + key + "</div>";
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
    if(is("Array", obj[value]) && is( "Number", obj[value][0] )){
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
function changeValue(name, select){
    /*
     * value: Activityなど
     * path: fullPath
     * select: 0 = 左を直接変更、1 = Propertyで変えた値を反映
     * 
     * name: "Variable:/Cell/Variable/C"の形にする（左のidの末尾以外がこの形になっている。）
     * valueKeys: ["Cell", "Variable", "C"]
     * 上記2つの最後にvalue(select)をつけることで、値を操作できるようにした。
     */


    var objM = model;
    var obj = model["root"];
    var valueKeys = name.split("/");


    if (select == 0){
        var value = document.getElementById("select:" + name).value;
        valueKeys.splice(0, 1);
        for(var i = 0; i < valueKeys.length; i++){
            obj = obj[valueKeys[i]];
        }
        var path = "";
        path = obj["FullID"];
        if(is("Array", obj[value])){
            obj[value][obj[value].length - 1] = Number(document.getElementById(name).value);
            socket.emit("change", [path, value, obj[value][obj[value].length - 1]]);
            console.log(obj[value][obj[value].length - 1]);
        }else{
            obj[value] = Number(document.getElementById(name).value);
            socket.emit("change", [path, value, obj[value]]);
        }
        document.getElementById("property_"+value).value = Number(document.getElementById(name).value);
    }else{
        name = valueKeys[0] + "/" + valueKeys[1].split(":")[0] + "/Variable/" + valueKeys[1].split(":")[1];
        valueKeys = valueKeys[1].split(":")[0] + "/Variable/" + valueKeys[1].split(":")[1];
        valueKeys = valueKeys.split("/");
        for(var i = 0; i < valueKeys.length; i++){
            obj = obj[valueKeys[i]];
        }
        document.getElementById(name).value = document.getElementById("property_"+select).value;
        if(is("Array", obj[value])){
            obj[value][obj[value].length - 1] = Number(document.getElementById(name).value);
        }else{
            obj[value] = Number(document.getElementById(name).value);
        }
    }
    console.log(name);
    console.log(valueKeys);
    merge(model, objM);
}

function changePropertyValue(path, select){
    /*
     * property側で変更をした内容をデータに反映させる関数
     */
    changeValue(path, select);
    
    socket.emit("change", [path, select, Number(document.getElementById("property_" + select).value)]);
}


// グラフ描画
var svg        = null; //森
var svg2       = null;
var yMax       = 1; //森
var yMin       = 0; //森
var xMax       = 1;
var xMin       = 0;
var mode       = "strip";
var margin     = null;
var width      = null;
var height     = null;
var xScale     = null;
var yScale     = null;
var xAxis      = null;
var yAxis      = null;
var zoom       = null;
var zooming    = false;
var line       = null;
var city       = null;
var lineList   = [] //multiline用のlineList
////森
var timeList       = [0];
var viewValues     = [];
var time_len       = 1000;
var redbull        = [[]]; //データ
var lookingVal     = "";
var lookingFlag    = "";
var lookingValList = [];
var invisibleList  = [];
var index;
var scaleChange    = 0; //森
var valueChange    = 0;
var addTime        = [];
var colorList = [ "#D55E00", "#0072B2", "#009E73", "#CC79A7", "#C4AD66", "#56B4E9"]
var data;
var viewFlag = false;
var xS = 1;
var xs = 0;
var xL = 0;
var timepoint  = 0;
var startpoint = 0;
var multiFlag  = 0;
 //森

// 時間データの調節用関数
function timeData(){
    for (var i = 0; i < interval; i++){
        timeList.push(i + 1);
    }
}

var shift = false; // shiftキーの判定
var ctrl  = false; // ctrlキーの判定
var meta  = false; // ???


document.onkeydown = function(e) {
    // Mozilla(Firefox, NN) and Opera
    console.log("hoge")
    if (e != null) {
        keycode = e.which;
        ctrl    = typeof e.modifiers == 'undefined' ? e.ctrlKey : e.modifiers & Event.CONTROL_MASK;
        shift   = typeof e.modifiers == 'undefined' ? e.shiftKey : e.modifiers & Event.SHIFT_MASK;
        meta    = typeof e.modifiers == 'undefined' ? e.metaKey : e.modifiers & Event.META_MASK;
        // イベントの上位伝播を防止
        // e.preventDefault();
        //e.stopPropagation();
        // Internet Explorer
    } else {
        keycode = event.keyCode;
        ctrl    = event.ctrlKey;
        shift   = event.shiftKey;
        meta    = event.metaKey;
        // イベントの上位伝播を防止
        //event.returnValue = false;
        //event.cancelBubble = true;
    }
}

document.onkeyup = function(e) {
    // Mozilla(Firefox, NN) and Opera
    if (e != null) {
        keycode = e.which;
        ctrl    = typeof e.modifiers == 'undefined' ? e.ctrlKey : e.modifiers & Event.CONTROL_MASK;
        shift   = typeof e.modifiers == 'undefined' ? e.shiftKey : e.modifiers & Event.SHIFT_MASK;
        meta    = typeof e.modifiers == 'undefined' ? e.metaKey : e.modifiers & Event.META_MASK;
        // イベントの上位伝播を防止
        //e.preventDefault();
        //e.stopPropagation();
        // Internet Explorer
    } else {
        keycode = event.keyCode;
        ctrl    = event.ctrlKey;
        shift   = event.shiftKey;
        meta    = event.metaKey;
        // イベントの上位伝播を防止
        //event.returnValue = false;
        //event.cancelBubble = true;
    }
}

var onColor  = "";
var offColor = "";
$(function() {
    $(document).on('mouseenter','.graphable',function(){
        offColor = $(this).css("color");
        $(this).css("color","red");
        onColor = $(this).css("color");
    });

    $(document).on('mouseleave','.graphable',function(){
        if( $(this).css("color") != onColor ){
            console.log("hoge")
            offColor = $(this).css("color");
        }
        $(this).css("color",offColor);
    });
});


// グラフ確認用関数
function viewGraph(id, flag, model_l){
    if( ( ctrl || meta ) && model_l === "none"  && lookingValList.length > 0 )
        multiFlag = 1;
    else if( model_l === "none" )
        multiFlag = 0;
    lookingFlag = flag;
    var valueKeys = id.split("/");
    if(model_l === "none"){
        changeTab("graphbtn","graphAll", 0);
        var obj = model["root"];
        index1 = -1;
        index2 = -1;
        for(var i = 0; i < lookingValList.length; i++){
            if( lookingValList[i][0] == id ){
                index1 = i;
            }
        }
    }
    index2 = invisibleList.indexOf(id);
    if(multiFlag == 1 && lookingValList.length < colorList.length){
        if(connect_num > 0 && model_l === "none"){
            if(index1 >= 0 && index2 < 0){
                // if user click the button of displayed data as graph, the graph is erased.
                invisibleList.push(id);
                document.getElementById("div:" + id).style.backgroundColor = "white";
                document.getElementById("div:" + id).style.color = "black";
            }else if( index2 >= 0 ){
                invisibleList.splice( index2, 1 );
                document.getElementById("div:" + id).style.backgroundColor = colorList[index1];
                document.getElementById("div:" + id).style.color = "white";
            } else {
                lookingVal = id;
                lookingValList.push([lookingVal,flag]);
                document.getElementById("div:" + id).style.borderColor = colorList[lookingValList.length-1];
                document.getElementById("div:" + id).style.backgroundColor = colorList[lookingValList.length-1];
    　　　      document.getElementById("div:" + id).style.color = "white";
                valueChange = 1;
                var strippoint = startpoint;
                if(mode == "history"){
                    strippoint = 0;
                }
                var valueKeys = lookingValList[lookingValList.length-1][0].split("/");
                for(var j = 1; j < valueKeys.length; j++){
                    obj = obj[valueKeys[j]];
                }
                if( lookingValList[lookingValList.length-1][1] == "Variable"){
                    viewValues.push(obj["Value"]);
                }else{
                    viewValues.push(obj["Activity"]);
                }
                var len = viewValues[0].length;
                var len2 = redbull.length;
                redbull = [];
                for(var i = 0; i < viewValues.length; i++){
                    var bull=[];
                    for(var j = 0; ( j + strippoint ) < len; j+=1){
                        bull.push({"x":model.time[j+strippoint], "y":viewValues[i][j+strippoint]});
                    }
                    redbull.push(bull);
                }
                yMin = d3.min(redbull, function(s){return d3.min(s,function(d){ return d.y; });});
                yMax = d3.max(redbull, function(s){return d3.max(s,function(d){ return d.y; });});
            }
        }
    }else if(multiFlag == 0){
        if( model_l == "none"){
            if(svg != null && lookingValList.length > 1 ){
                for(var i = 0; i < lookingValList.length; i++ ){
                    document.getElementById("div:" + lookingValList[i][0]).style.borderColor     = "black";
                    document.getElementById("div:" + lookingValList[i][0]).style.backgroundColor = "white";
                    document.getElementById("div:" + lookingValList[i][0]).style.color           = "black";
                }
                lookingValList = [];
                invisibleList  = [];
                lookingVal = "";
            }
            if(id === lookingVal && invisibleList.indexOf(lookingVal) < 0){
                invisibleList.push(lookingVal);
                document.getElementById("div:" + lookingValList[0][0]).style.backgroundColor = "white";
                document.getElementById("div:" + lookingValList[0][0]).style.color           = "black";
            }else{
                if( lookingVal != "" ){
                    document.getElementById("div:" + lookingValList[0][0]).style.borderColor     = "black";
                    document.getElementById("div:" + lookingValList[0][0]).style.backgroundColor = "white";
                    document.getElementById("div:" + lookingValList[0][0]).style.color           = "black";
                }
                invisibleList  = [];
                lookingVal    = id;
                lookingValList = [[lookingVal,flag]];
                for(var i = 1; i < valueKeys.length; i++){
                    obj = obj[valueKeys[i]];
                }
                if(flag == "Variable"){
                    viewValues = [obj["Value"]];
                }else{
                    viewValues = [obj["Activity"]];
                }
                document.getElementById("div:" + id).style.borderColor = colorList[0];
                document.getElementById("div:" + id).style.backgroundColor = colorList[0];
                document.getElementById("div:" + id).style.color = "white";
                redbull=[[]];
　　　　　　    valueChange = 1;
                var strippoint = startpoint;
                if( mode == "history"){
                    strippoint = 0;
                }
                for( var i = 0; ( i + strippoint ) < viewValues[0].length; i+=1 ){
                    redbull[0].push({"x":model.time[i+strippoint], "y":viewValues[0][i+strippoint]});
                }
                yMin = d3.min(redbull, function(s){return d3.min(s,function(d){ return d.y; });});
                yMax = d3.max(redbull, function(s){return d3.max(s,function(d){ return d.y; });});
            }
        }
    }
    makeGraph();

    // property
    //propertyを１つにリセット
    // noko
    var btnP = document.getElementById("propertyBtnList");
    btnP.innerHTML = ""; // propertyBtnListを空に

    if(lookingValList.length != 0){
        for(var i in lookingValList){
            var property_check_list = lookingValList[i][0].split("/");
            btnP.innerHTML += "<span onclick='changeTab(this.id, " + i + ", 1)' class='property_subtab' id='property_" + i + "'>" + property_check_list[property_check_list.length - 1] + "</span>";
        }
        changeTab("property_" + property_sub_number, property_sub_number, 2);
    }
}


function makeData(a, b){
    //これで動くはず 森 //とりあえず間引きはなしで
    var x_b   = a;
    var last  = Math.min(xS,end_time)
    for(var i = timepoint; x_b[i]<last; i += 1){
        for(var j = 0; j < b.length; j++){
            redbull[j].push({"x": x_b[i], "y": b[j][i]});
        }
    }
    for( var j = 0; j < b.length && x_b[i]<end_time; j++ ){
         redbull[j].push({"x": x_b[i+1], "y": b[j][i+1]});
    }

    timepoint = i;
    //グラフが表示されていたら
    if( lookingVal != ""  && connect_num%2 == 0 && multiFlag == 0 ){
        //もし，y軸の最大値と最小値が変わった時だけ,y軸のスケールをかえる，森
        if( yMin > d3.min(redbull, function(s){return d3.min(s,function(d){ return d.y; });}) || yMax < d3.max(redbull, function(s){return d3.max(s,function(d){ return d.y; });})  || connect_num == 2){
            lineList = [];
            yMin     = d3.min(redbull, function(s){return d3.min(s,function(d){ return d.y; });});
            yMax     = d3.max(redbull, function(s){return d3.max(s,function(d){ return d.y; });});

            xScale = d3.scale.linear()
                .domain([xMin, xS])
                .range([5, width]);

            xAxis = d3.svg.axis()
                .scale(xScale)
                .orient("bottom")
                .innerTickSize(-height)  // 目盛線の長さ（内側）
                .outerTickSize(0) // 目盛線の長さ（外側）
                .tickPadding(10); // 目盛線とテキストの間の長さ

            yScale = d3.scale.linear()
                .domain([yMin,yMax])
                .range([height, 0]);

            yAxis = d3.svg.axis()
                .scale(yScale)
                .orient("left")
                .innerTickSize(-width)  // 目盛線の長さ（内側）
                .outerTickSize(0) // 目盛線の長さ（外側）
                .tickPadding(10); // 目盛線とテキストの間の長さ

            line = d3.svg.line()
                   .interpolate("basis")
                   .x(function(d) { return xScale(d.x); })
                   .y(function(d) { return yScale(d.y); });

            svg.selectAll("g.y.axis")
                .attr("class","y axis")
                .call(yAxis);

        }
        for( var i = 0; i < redbull.length; i++){
            pathData = cull(redbull[i])
            if(invisibleList.indexOf(lookingValList[i][0]) < 0 ){
                svg.select("path.line")
                    .attr("d",line(pathData));
            }else{
                svg.select("path.line")
                    .attr("d",line([]));
            }
        }
    }
}

function setScale(dataset){
    if(  step_num % ( interval * 500 ) == 0 || connect_num == 2 ){
        //平均ステップ幅を元に計算 森
        if( mode == "history"){
            xL =  Math.floor( 1000 / Math.exp(-30*Math.pow((model.time[model.time.length-1]-model.time[0]) / model.time.length,100)));
        }else{
            xL =  1000 * (model.time[model.time.length-1]-model.time[0]) / model.time.length;
            if( xL == 0 ){
                xL = 10;
            }
        }
        if(xS == 1){
　　　　　  xS      = xL;
            redbull = [[]];
        }
        scaleChange = 1;
    }else if(xS != 0){
        while(xS < d3.max(dataset, function(d){ return d.x })){
            xS += xL;
            xs = model.time[timepoint]; // timepointが前の最後の時間を示すはず？ 森
            startpoint  = timepoint
            scaleChange = 1;
            //stripモードの時だけ，redbullの中身を空に 森
            if( redbull[0].length > 1 ){
                yMin = redbull[0][redbull[0].length-1].y;
                yMax = redbull[0][redbull[0].length-1].y;
            }
            if(mode == "strip"){
                var bull=[]
                for(var i = 0; i < redbull.length; i++ ){
                    bull.push([])
                }
                redbull = bull;
            }
        }
    }
}

function makeLinechart(){
    //スケールが変わるごとにgraphのhtmlとsvgをからにする
　　lineList = [];
    document.getElementById("graph").innerHTML = "";
    var divW = document.getElementById("subContents").clientWidth;
    var divH = divW * 9/16;

    console.log(divH,divW)
    margin = {top: 20, right: 80, bottom: 50, left: 80};
    width = divW - margin.left - margin.right;
    height = divH - margin.top - margin.bottom;

    if(svg != null ){
       d3.select("svg").remove();
    }

    if( mode == "history"){
        xMin = 0;
        xMax = redbull[0][ redbull[0].length -1 ].x;
    }else{
        xMin = xs;
        xMax = xS;
    }
    xScale = d3.scale.linear()
        .domain([xMin, xMax + (xMax - xMin) * 0.01])
        .range([0, width]);

    yScale = d3.scale.linear()
        .domain([yMin,yMax])
        .range([height, 0]);

    line = d3.svg.line()
        .interpolate("basis")
        .x(function(d) { return xScale(d.x); })
        .y(function(d) { return yScale(d.y); });

    if(document.getElementById("stopbtn").disabled  == false){
        svg = d3.select("#graph").append("svg")
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("class","graphMain")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")")
    }else{
        zoom = d3.behavior.zoom()
            .x(xScale)
            .y(yScale)
            .scaleExtent([1, 1.0e+200])
            .on("zoom", zoomed);

        svg = d3.select("#graph").append("svg")
            .call(zoom)
            .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("class","graphMain")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
    }

    xAxis = d3.svg.axis()
        .scale(xScale)
        .orient("bottom")
        .innerTickSize(-height)  // 目盛線の長さ（内側）
        .outerTickSize(0) // 目盛線の長さ（外側）
        .tickPadding(10); // 目盛線とテキストの間の長さ

    yAxis = d3.svg.axis()
        .scale(yScale)
        .orient("left")
        .innerTickSize(-width)  // 目盛線の長さ（内側）
        .outerTickSize(0) // 目盛線の長さ（外側）
        .tickPadding(10); // 目盛線とテキストの間の長さ

    svg.append("g")
        .attr("class", "x axis")
        .attr("transform", "translate(0," + height + ")")
        .call(xAxis);

    svg.append("g")
        .attr("class", "y axis")
        .call(yAxis);

    svg.append("clipPath")
        .attr("id", "clip")
        .append("rect")
        .attr("width", width)
        .attr("height", height);

    for(var i = 0; i < redbull.length; i++){
        pathData = cull(redbull[i]);
        if( invisibleList.indexOf( lookingValList[i][0] ) < 0 ){
            svg.append("path")
                .attr("class", "line")
                .attr("clip-path", "url(#clip)")
                .attr("d", line(pathData))
                .style("stroke",colorList[i])
                .style("fill","none")
                .style("stroke-width","1.8px");
        }
    }
}

function zoomed(){
    if(xScale.domain()[0]<0){
       xScale.domain([0,xScale.domain()[1]])
       xAxis = d3.svg.axis()
           .scale(xScale)
           .orient("bottom")
           .innerTickSize(-height)  // 目盛線の長さ（内側）
           .outerTickSize(0) // 目盛線の長さ（外側）
           .tickPadding(10); // 目盛線とテキストの間の長さ
    }
    var j = 0;
    var pathDataList = [];
    console.log(invisibleList);
    for( var i = 0; i < redbull.length; i++ ){
        var pathData = cull(redbull[i]);
        pathDataList.push(pathData);
        if( invisibleList.indexOf( lookingValList[i][0] ) < 0 ){
            j += 1;
            min = d3.min(pathData, function(d){ if( d.x > xScale.domain()[0] && d.x < xScale.domain()[1] )return d.y;});
            max = d3.max(pathData, function(d){ if( d.x > xScale.domain()[0] && d.x < xScale.domain()[1] )return d.y;});
            if( j == 1 ){
                yMin = min;
                yMax = max;
            } else if(max > yMax) {
                yMax = max;
            } else if(min < yMin) {
                yMin = min;
            }
        }
    }
    yScale.domain([yMin,yMax]);
    yAxis = d3.svg.axis()
        .scale(yScale)
        .orient("left")
        .innerTickSize(-width)  // 目盛線の長さ（内側）
        .outerTickSize(0) // 目盛線の長さ（外側）
        .tickPadding(10); // 目盛線とテキストの間の長さ

    svg.select(".x.axis").call(xAxis);
    svg.select(".y.axis").call(yAxis);
    svg.selectAll("path.line").remove()

    line = d3.svg.line()
        .interpolate("basis")
        .x(function(d) { return xScale(d.x); })
        .y(function(d) { return yScale(d.y); });

    for(var i = 0; i < redbull.length; i++){
        if( invisibleList.indexOf( lookingValList[i][0] ) < 0 ){
            svg.append("path")
                .attr("class", "line")
                .attr("clip-path", "url(#clip)")
                .attr("d", line(pathDataList[i]))
                .style("stroke",colorList[i])
                .style("fill","none")
                .style("stroke-width","1.8px");
        }
    }
}

function makeGraph(){
    if(lookingVal != ""){
        if( multiFlag == 0  ){
            setScale(redbull[0]);
            //スケール,変数切り替わった時のみグラフを初期化 更新 森
            if(scaleChange == 1 || valueChange == 1 || connect_num==1 ){
                makeLinechart();
            }
        makeData(model.time, viewValues);
        }else{
            //現時点ではマルチの状態ではsvgごと更新しないと,グラフが表示されない 1森
            setScale(redbull[0]);
            makeData(model.time, viewValues);
            yMin = d3.min(redbull, function(s){return d3.min(s,function(d){ return d.y; });});
            yMax = d3.max(redbull, function(s){return d3.max(s,function(d){ return d.y; });});
            makeLinechart();
        }
    }else{
        //グラフの表示がない時はとりあえずタイムでデータを作っておく．じゃないとエラー 森
        setScale(redbull[0]);
        makeData(model.time, [model.time]);
    }
    scaleChange = 0;
    valueChange = 0;
}

function cull(data){
    culledData = [];
    if(data.length > 2000){
        for(var i = 0; i < data.length; i += Math.ceil(data.length/5000)){
            culledData.push(data[i]);
        }
        return culledData;
    }else{
        return data;
    }
}

//discription表示用の関数 現時点ではsbml等がもともと持っているxhtml構造をベタ貼り 森
function viewDiscription(){
    document.getElementById("discription").innerHTML = discription;
}

function viewProperties(target, num){
    /*
     * target: 何番目のsubPropertyを呼んでいるか。
     */
    if (lookingValList.length != 0){
        var keys = lookingValList[target][0].split("/");
        keys.shift();
        var obj = model["root"];
        for(var k in keys){
            obj = obj[keys[k]];
        }

        var element = document.getElementById("viewProperty");
        if(num != 2 || run_flag == false){
            element.innerHTML = ""; // 上段を削除

            element.innerHTML += obj["FullID"] + "<br>";
            element.innerHTML += "<span id='property_expression'></span>";
            element = document.getElementById("property_expression");

            if ("mathml" in obj){ // mathmlがあるならmathml
                var expression = obj["mathml"]
                //console.log(expression)
                element.innerHTML += expression;

                window.MathJax = {
                    jax: ["input/TeX","input/MathML","output/HTML-CSS","output/NativeMML"],
                    extensions: ["tex2jax.js","mml2jax.js","MathMenu.js","MathZoom.js"],
                    TeX: {
                        extensions: ["AMSmath.js","AMSsymbols.js"]
                    },
                    MathML: { extensions: ["mml3.js", "content-mathml.js"]},
                    tex2jax: {
                        inlineMath: [ ['$','$'], ["\\(","\\)"] ],
                        processEscapes: true
                    }
                };
                (function(d, script) {
                    script = d.createElement('script');
                    script.type = 'text/javascript';
                    script.async = true;
                    script.onload = function(){
                        // remote script has loaded
                    };
                script.src = 'https://cdn.mathjax.org/mathjax/latest/MathJax.js';
                d.getElementsByTagName('head')[0].appendChild(script);
                }(document));
                setTimeout(function(){
                    if (document.getElementsByClassName("MathJax_Error").length != 0){
                        element.innerHTML = obj["Expression"];
                    }}, 500
                ); // 気持ち悪いから後で直す。


            }else if("Expression" in obj){ // mathmlがなければexpression
                element.innerHTML += obj["Expression"];
            }
            element.innerHTML += "<br>";
        }

        var element2 = document.getElementById("viewProperty2_key"); // 下段左
        var element3 = document.getElementById("viewProperty2_val"); // 下段右
        element2.innerHTML = "";
        element3.innerHTML = "";

        for (var key in obj){
            if(key != "mathml" && key != "Expression" && key != "FullID"){
                element2.innerHTML += "<div class='propertySubUnit'>" + key + "</div>";
                if(is("Array", obj[key])){
                    element3.innerHTML += "<div class='propertySubUnit'><form class='property_form' onsubmit='changePropertyValue(\"" + obj["FullID"] + "\", \"" + key + "\");return false;'><input type='text' value='" + obj[key][obj[key].length - 1] + "' id='property_" + key + "' onchange=''></form></div>";
                }else{
                    element3.innerHTML += "<div class='propertySubUnit'><form class='property_form' onsubmit='changePropertyValue(\"" + obj["FullID"] + "\", \"" + key + "\"); return false;'><input type='text' value='" + obj[key] + "' id='property_" + key + "' onchange=''></form></div>";
                }
                if(key == "Value" || key == "Fixed"){
                    document.getElementById("property_" + key).disabled = false;
                }else{
                    document.getElementById("property_" + key).disabled = true;
                }
            }
        }
    }
}

function changeTab( idName, target, num ){
    var elements1, elements2
    if(num == 0){
        elements1 = document.getElementsByClassName("subtab");
        elements2 = document.getElementsByClassName("tabContent");


        for(var i = 0; i < elements2.length; i++){
            if(elements2[i].id === target){
                elements2[i].style.display = "block";
                if(target === "discription"){
                    viewDiscription();
                } else if(target === "graphAll"){
                    var w = document.getElementById("subContents").clientHeight;
                    document.getElementById("graphAll").style.height = 100 + "%";
                    document.getElementById("graph").style.height = 100 + "%";
                }
            }else{
                elements2[i].style.display = "none";
            }
        }
    }else{ // property_subtabがクリックされた時の動き
        elements1 = document.getElementsByClassName("property_subtab");
        property_sub_number = target;
        viewProperties(target, num);
    }

    for(var i = 0; i < elements1.length; i++){
        if(elements1[i].id === idName){
            elements1[i].style.backgroundColor = "#4c4c4c";
            elements1[i].style.color = "white";
        }else{
            elements1[i].style.backgroundColor = "white";
            elements1[i].style.color = "black";
        }
    }
}

function modeChange(viewmode){
    mode = viewmode;
    //historyのときは,redbullを一旦からにして，過去のデータをついか
    if(mode=="history"){
        var bull=[]
    for(var i = 0; i < redbull.length; i++ ){
        bull.push([])
    }
    redbull = bull;
    for(var i = 0; i<timepoint; i += 1){
        for( var j = 0; j < redbull.length; j++ ){
            redbull[j].push({"x": model.time[i], "y": viewValues[j][i]});
            }
        }
    }else{
        var bull=[]
    for(var i = 0; i < redbull.length; i++ ){
        bull.push([])
    }
        redbull = bull;
    for(var i = startpoint; i<timepoint; i += 1){
        for( var j = 0; j < redbull.length; j++ ){
            redbull[j].push({"x": model.time[i], "y": viewValues[j][i]});
            }
        }
    }
    scaleChange = 1;
    yMin = d3.min(redbull, function(s){return d3.min(s,function(d){ return d.y; });});
    yMax = d3.max(redbull, function(s){return d3.max(s,function(d){ return d.y; });});
    makeGraph();
}

// simulation用 gloval変数
var time = 0;
var step_num = 0;
var start_time = 0;
var interval = 100;
var sim_style;
var connect_num = 0;
var thining = 1;
var judge = {"time": false, "interval": false};
var end_time = 0;
var run_flag = false;

// simulationを始める関数. runやstepが押された時にこれが動く
function strt(style){
    var runbtn = document.getElementById("runbtn");
    //var stepbtn = document.getElementById("stepbtn");
    var autobtn = document.getElementById("autobtn");
    var stopbtn = document.getElementById("stopbtn");
    if(connect_num > 2)
        if( svg != null )
            modeChange("strip");
    document.getElementById("history").style.display = "none";
    document.getElementById("strip").style.display = "none";
    if(document.getElementById("interval").value > 0 && document.getElementById("interval").value.match(/^-?[0-9]+$/)){ // intervalのinputが正の整数の時
        if(interval != Number(document.getElementById("interval").value)){
            step_num = 0;
            interval = Number(document.getElementById("interval").value);
        }
        judge.interval = true;
    }
    if(document.getElementById("timeInp").value > 0 && document.getElementById("timeInp").value.match(/^-?[0-9]+$/)){ // timeのinputが正の整数の時
        time = Number(document.getElementById("timeInp").value);
        judge.time = true;
    }
    sim_style = style; // "run" or "step" or "auto"
    if(judge.time && judge.interval){ // 全て正しい値が入力されている場合
        viewFlag = true;
        runbtn.disabled = true;
        //stepbtn.disabled = true;
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
    //var stepbtn = document.getElementById("stepbtn");
    var autobtn = document.getElementById("autobtn");
    var stopbtn = document.getElementById("stopbtn");
   if(sim_style == "run"){
        if(model.time[model.time.length - 1] - start_time < time){
            runSim();
        }else{
            time = 0;
            document.getElementById("history").style.display = "inline-block";
            document.getElementById("strip").style.display = "inline-block";
            runbtn.disabled = false;
            autobtn.disabled = false;
            stopbtn.disabled = true;
            scaleChange = 1;
            if(svg != null){
                makeGraph();
            }
            start_time = end_time;

        }
    }else if(sim_style == "auto"){
        if(run_flag == true){
            if(model.time[model.time.length - 1] > end_time){
                end_time = end_time + time;
            }
            runSim();
        }else{
            time = 0;
            runbtn.disabled = false;
            autobtn.disabled = false;
            stopbtn.disabled = true;
        	scaleChange = 1;
            if(svg != null){
                makeGraph();
            }
            start_time = Math.floor(model.time[model.time.length - 1]);
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
            if(svg != null)
                makeGraph();
            start_time = Math.floor(model.time[model.time.length - 1]);
            runbtn.disabled = false;
            autobtn.disabled = false;
            stopbtn.disabled = true;
        }
    }
}

function stop_sim(){ // stopボタンをおした時
    document.getElementById("history").style.display = "inline-block";
    document.getElementById("strip").style.display = "inline-block";
    if(sim_style == "auto"){
        run_flag = false;
    }
    else if(sim_style == "run"){
        time = model.time[model.time.length - 1] - start_time;
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

//大沼ゾーン

/*
~ CSVファイルデータのダウンロード ~
ReadData: データの取得
MakeCSV:  データのCSVファイル化
Download: データのダウンロード
*/
function ReadData(obj1, result){
    /* obj1: model
     * result: csvdata
     */
    if(obj1 === Object(obj1)) {
	    for(var key in obj1) {
	        if((key === "Activity" || key === "Value")){
		        if(is("Number", obj1[key])){
                    var num = obj1[key];
		            obj1[key] = [];
                    for(var i in result.time){
                        obj1[key].push(num);
                    }
		        }
		        result[obj1["FullID"]] = obj1[key];
            }else{
                if(is("Object",obj1[key])){
                    ReadData(obj1[key], result);
                }
            }
	    }
    }
}

function MakeCSV(obj1){
    var csvData = {};
    csvData.time = model["time"];
    ReadData(model["root"], csvData);
    //console.log(csvData);

    var string = "";
    //console.log(Object.keys(csvData));
    for(var key in csvData){
        string += key;
        string += ",";
    }
    string += "\n";
    for(var i in csvData.time){
        for(var key in csvData){
            string += csvData[key][i];
            string += ",";
        }
        string += "\n";
    }
    //console.log(string);

    Download(string);
}

function Download(string){
    var blob = new Blob([ string ], { "type" : "text/csv" });
    var link = document.createElement("a");
    link.href = URL.createObjectURL(blob);
    link.download = "result.csv";
    link.click();
}
