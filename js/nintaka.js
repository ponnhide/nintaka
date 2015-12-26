/*
    # D3.jsからのベタ書きに変更
    # runした時、終わりの時間を調整
    # 500秒ごとにグラフが切り替わる
*/

var socket = io();

// graphのDivサイズを調節する関数
function graphdiv_change(){
    var divW = document.getElementById("graph").clientWidth;
    var divH = divW * 9 / 16;
    document.getElementById("graph").style.height = divH + "px";
}

// load用関数.model_lにデータを格納するソケット
socket.on("load", function(model_l) {
    connect_num += 1; //森
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

// ページをロードした時に動く関数
function init(){
    document.getElementById("discription").style.display = "none"; //森 
    var modelName = localStorage.getItem("modelName");
    var modelType = localStorage.getItem("modelType"); // 森 
    socket.emit("load", [modelName, modelType]); // emlをloadする
    document.getElementById("modelName").textContent = modelName;
    document.getElementById("simulation").style.display = "inline";
    document.getElementById("graphbtn").style.display = "none";
    document.getElementById("history").style.display = "none"; 
    graphdiv_change();
}

// step回したあとのValue変更用関数
function setValueAll(model_l){
    merge(model,$.extend(true,{},model_l)); //深いコピーをしないとmodel_lの構造が変わってしまう．
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
    var kayo = 0;
    if(obj1 === Object(obj1)) {
        for(var key in obj1) {
            if((key === "Activity" || key === "Velocity" || key === "Value" || key === "time") && is("Array", obj2[key])){
                //obj1[key] = obj1[key].concat(obj2[key]);
                Array.prototype.push.apply(obj1[key],obj2[key])
		// データの長さを調節
                // if(obj1[key].length > dataLen){
                //     obj1[key].splice(0, obj1[key].length - dataLen);
                // }
            } else {
		if(is("Object",obj1[key]))
                    merge(obj1[key], obj2[key]);
            	else
                    obj1[key] = obj2[key];
	    }
        }
    }
    //return obj1;
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
            parentObj.innerHTML = "<div class=\"graphable\" id='div:" + id + "' style='display:inline-block; width:29%; overflow:scrole;' onclick='viewGraph(\"" + id + "\", \"" + flag + "\", \"none\")'>" + key + "</div>";
        }else{ // それ以外は黒
            parentObj.innerHTML = "<div class=\"static\" d='div:" + id + "' style='display:inline-block; width:29%; overflow:scrole;'>" + key + "</div>";
        }
        inp += "</select><input type='text' id='" + formId + "'></form>";
        parentObj.innerHTML += inp;
        setValue(formId);
    }
}



/*function makeSummary( id, flag ){
    var divS = document.getElementById("summary");
    var obj = model["root"]
    var valueKeys = id.split("/");
    var vPropertyList  = ["Name","Value","Velocity","MolorConc","NumberConc","Fixed"];
    var p1PropertyList = ["RuleClass","Name","Activity","VariableReferenceList","Expression"];  
    var p2PropertyList = ["RuleClass","Name","Activity","VariableReferenceList","EventAssignmentList","Triggner"];  

    for(var i = 0; i < valueKeys.length; i++){
        obj = obj[valueKeys[i]];
    }
    var summary = "<ul class='summary'><li>" + obj["FullID"] + "<ul>%s</ul></li></ul>";
    var child   = "";
    
    if( flag == "Variable" ){
	for( aProperty in vPropertyList ){
	    if( is("Array",obj[aProperty]) && is( "Number", obj[aProperty][0] )){
	    	if(aproperty == "fixed" || aproperty == "value")
		    child += "<li>" + aproperty + obj[aproperty][ obj[aproperty].length-1 ] + "</li>";
            	else
		    child += "<li>" + aproperty + obj[aproperty][ obj[aproperty].length-1 ] + "</li>";
	    }else{
		if(aproperty == "fixed" || aproperty == "value")
		    child += "<li>" + aproperty + obj[aproperty] + "</li>";
            	else
                    child += "<li>" + aproperty + obj[aproperty][ obj[aproperty].length-1 ] + "</li>";
	    }
	}
    	divS.innerHTML = summary.replace("%s","child"); 
    }else{ 
   	for( aProperty in vPropertyList ){
    	    if( is("Array",obj[aProperty]) && is( "Number", obj[aProperty][0] )){ 
	    	child += "<li>" + aProperty + obj[aProperty][ obj[aProperty].length-1 ] + "</li>";
	    }else if( is("Array", obj[aPrpperty])){
		child += "<li>" + obj[aProperty] + "</li>";
            }else{
                child += "<li>" + aProperty + obj[aProperty] + "</li>";
	    }
	}
    }

} */

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
function changeValue(name){
    var value = document.getElementById("select:" + name).value;
    var valueKeys = name.split("/");
    valueKeys.splice(0, 1);
    var obj = model["root"];
    var path = "";
    for(var i = 0; i < valueKeys.length; i++){
        obj = obj[valueKeys[i]];
    }
    path = obj["FullID"];
    socket.emit("change", [ path, value, Number(document.getElementById(name).value)]);
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
var lookingValList = []
var scaleChange    = 0; //森
var valueChange    = 0;
var addTime        = [];
var colorList      = ["#DC143C","#4169E1","#FFD700","#32CD32","#8A2BE2"] //森
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
    // console.log(addTime);
    for (var i = 0; i < interval; i++){
        timeList.push(i + 1);
    }
}

// グラフ確認用関数
function viewGraph(id, flag, model_l){
    if((event.ctrlKey || event.metaKey) && model_l === "none"  && lookingValList.length < 5 && lookingValList.length > 0 )
	multiFlag = 1;
    else if( model_l === "none" ) 
        multiFlag = 0;
    lookingFlag = flag;
    var valueKeys = id.split("/");
    if(model_l === "none" || connect_num == 1){
        document.getElementById("graph").style.display = "block"; //森
        document.getElementById("discripbtn").style.display = "block";
        document.getElementById("discription").style.display = "none";
    } 
    var obj = model["root"];
    if(multiFlag == 1){ 
        if( lookingVal != id ){ 
            lookingVal = id;
	    lookingValList.push([lookingVal,flag]);
            document.getElementById("div:" + id).style.borderColor = colorList[lookingValList.length-1];
    	}

        if(connect_num > 0 && model_l === "none"){     
　　　      valueChange = 1;
            var strippoint = startpoint;
            if( mode == "history"){
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
            for( var i = 0; i < viewValues.length; i++ ){
                var bull=[];
                for( var j = 0; ( j + strippoint ) < len; j+=1 ){
                    bull.push({"x":model.time[j+strippoint], "y":viewValues[i][j+strippoint]}); 
		}
                redbull.push(bull);
            }
            yMin = d3.min(redbull, function(s){return d3.min(s,function(d){ return d.y; });});
            yMax = d3.max(redbull, function(s){return d3.max(s,function(d){ return d.y; });});
        }

    
    }else if(multiFlag == 0){ 
	
        if(  svg != null && id != lookingValList[0][0]){ 
            for(var i = 0; i < lookingValList.length; i++ ){
                document.getElementById("div:" + lookingValList[i][0]).style.borderColor = "black";
	    }
        }
        lookingVal = id;
        lookingValList = [[lookingVal,flag]];
       if(model_l==="none"){
 	   for(var i = 1; i < valueKeys.length; i++){
               obj = obj[valueKeys[i]];
            }
            if(flag == "Variable"){
            	viewValues = [obj["Value"]];
            }else{
                viewValues = [obj["Activity"]];
            }
	    document.getElementById("div:" + id).style.borderColor = colorList[0];
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
    //切り替えたときも同じ分グラフが表示されるようにする 森
    /*
    if(model_l === "none" && connect_num > 1){
        if(multiFlag == 1 && lookingValList.length < 5){
	    //ctrlKeyが押されている時は複数グラフ表示
            var bull=[];
　　　　　　valueChange = 1;
            var strippoint = startpoint;
            if( mode == "history"){
                strippoint = 0;
            } 
            for( var i = 0; i < redbull.length; i+=1 ){
                bull.push({"x":model.time[i+strippoint], "y":viewValues[viewValues.length-1][i+strippoint]}); 
            }
	    redbull.push(bull);
            yMin = d3.min(redbull, function(s){return d3.min(s,function(d){ return d.y; });});
            yMax = d3.min(redbull, function(s){return d3.min(s,function(d){ return d.y; });});
        }else{ 
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
    }*/
    makeGraph();
}


function makeData(a, b){
   //var time_len   = x_b.length;
    //これで動くはず 森 //とりあえず間引きはなしで 
    var x_b   = a;
    var last  = Math.min(xS,end_time)
    for(var i = timepoint; x_b[i]<last; i += 1){
	for( var j = 0; j < b.length; j++ ){
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
                     .orient("bottom");
         
            yScale = d3.scale.linear()
                .domain([yMin,yMax])
                .range([height, 0]);

            yAxis = d3.svg.axis()
                .scale(yScale)
                .orient("left");
            
	    line = d3.svg.line()
                   .interpolate("basis")
                   .x(function(d) { return xScale(d.x); })
                   .y(function(d) { return yScale(d.y); });
            
            svg.selectAll("g.y.axis")
                .attr("class","y axis")
                .call(yAxis);
        
        }
        //if( redbull.length < 3 ){
        //city.selectAll(".line")
        //    .attr("d", function(d,i) { return line(redbull[i]); });
        for( var i = 0; i < redbull.length; i++){
            svg.select("path.line")
                .attr("d",line(redbull[i]));
		//.style("stroke",colorList[i]);
    	}
	//}
    }
    //svg.selectAll("path.line")
    //   .datum(redbull)
    //   .attr("d",line); 
    //森

   //return bull;
}

function setScale(dataset){
    //if(xS == 0 && step_num > 1){ //配列の中が空の時は何もしないstep()が100回動いたら更新 森
    if(  step_num % ( interval * 1000 ) == 0 || connect_num == 2 ){
        //xL = Math.floor((model.time[model.time.length - 1] - model.time[0])) * model.time.length / 10;
        //平均ステップ幅を元に計算 森
        if( mode == "history"){
	    //xS = xS - xL;
	    xL =  Math.floor( 1000 / Math.exp(-30*Math.pow((model.time[model.time.length-1]-model.time[0]) / model.time.length,100))); 
	    //xS += xL;
	}else{
	    xL =  Math.min(Math.floor( 100 / Math.exp(-50*Math.pow((model.time[model.time.length-1]-model.time[0]) / model.time.length,1000))),1000); 
	}
        if(xS == 1){
　　　　　  xS      = xL;
            redbull = [[]];
   	    scaleChange = 1;
        }
    }else if(xS != 0){
        while(xS < d3.max(dataset, function(d){ return d.x })){
            xS += xL;
            xs = model.time[timepoint];//timepointが前の最後の時間を示すはず？ 森
            startpoint  = timepoint
            scaleChange = 1;
	    //stripモードの時だけ，redbullの中身を空に 森
	    console.log(redbull)
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
    var divW = document.getElementById("graph").clientWidth,
    divH = document.getElementById("graph").clientHeight;
    margin = {top: 20, right: 100, bottom: 50, left: 100};
    width = divW - margin.left - margin.right;
    height = divH - margin.top - margin.bottom;
    
    if(svg != null ){
       d3.select("svg").remove();
    }
    
    if( mode == "history"){
        xMin = 0;
    	xMax = model.time[model.time.length-1];
    }else{
        xMin = xs;
    	xMax = xS;
     } 
     xScale = d3.scale.linear()
         .domain([xMin, xMax + (xMax - xMin) * 0.01])
         .range([5, width]);
    
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
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
    }else{

	zoom = d3.behavior.zoom()
	    .x(xScale)
	    .y(yScale)
	    .scaleExtent([1, 1000000])
	    .on("zoom", zoomed);	
	
	svg = d3.select("#graph").append("svg")
	    .call(zoom)
	    .attr("width", width + margin.left + margin.right)
            .attr("height", height + margin.top + margin.bottom)
            .append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
    }
    //if( xs == 0 )
    //    xMax = model.time[model.time.length-1];
    //else
    //    xMax = xS;


    xAxis = d3.svg.axis()
        .scale(xScale)
        .orient("bottom");

    yAxis = d3.svg.axis()
        .scale(yScale)
        .orient("left");
    	
   
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
    
    
    /*
    city = svg.selectAll(".city")
        .data(redbull)
        .enter().append("g")
        .attr("class", "city");
    
    city.append("path")
        .attr("class", "line")
        .attr("d", function(d) { return line(d); })
        .style("stroke", function(d,i) { return colorList[i]; });
    */	
    for(var i = 0; i < redbull.length; i++){ 
        svg.append("path")
            .attr("class", "line")
            .attr("clip-path", "url(#clip)")
	    .attr("d", line(redbull[i]))
            .style("stroke",colorList[i])
	    .style("fill","none")
            .style("stroke-width","1.8px");
    }

}

function zoomed(){
    if(xScale.domain()[0]<0){ 
       xScale.domain([0,xScale.domain()[1]])
       xAxis = d3.svg.axis()
          .scale(xScale)
          .orient("bottom");
    }

    /*var redbull2 = []
    for(var i = 0; i < redbull.length; i++ ){
	redbull2.push([]);
	for( var j = 0; j < redbull[i].length; j++ ){
	    console.log(redbull[i][j].x)
	    if( redbull[i][j].x > xScale.domain()[0] ){
	    	redbull2[i].push(redbull[i][j]) 
	    }
	    if( redbull[i][j].x > xScale.domain()[1] ){
	    	break 
	    }
	}
    }*/
    //console.log(redbull2);
    yMin = d3.min(redbull, function(s){return d3.min(s,function(d){ if( d.x > xScale.domain()[0] && d.x < xScale.domain()[1] )return d.y;} );});
    yMax = d3.max(redbull, function(s){return d3.max(s,function(d){ if( d.x > xScale.domain()[0] && d.x < xScale.domain()[1] )return d.y;} );});
    //console.log(yMin,yMax); 
    yScale.domain([yMin,yMax])
    yAxis = d3.svg.axis()
        .scale(yScale)
        .orient("left");
    //makeLinechart()
    svg.select(".x.axis").call(xAxis);
    svg.select(".y.axis").call(yAxis);   
    svg.selectAll("path.line").remove() 
    
    line = d3.svg.line()
        .interpolate("basis")
        .x(function(d) { return xScale(d.x); })
        .y(function(d) { return yScale(d.y); }); 
 

    for(var i = 0; i < redbull.length; i++){ 
        svg.append("path")
            .attr("class", "line")
  	    .attr("clip-path", "url(#clip)")
            .attr("d", line(redbull[i]))
            .style("stroke",colorList[i])
	    .style("fill","none")
            .style("stroke-width","1.8px");
    }
}

function makeGraph(){
    //document.getElementById("graph").innerHTML = "";
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


//discription表示用の関数 現時点ではsbml等がもともと持っているxhtml構造をベタ貼り 森
function viewDiscription(){
    document.getElementById("graph").style.display = "none";
    document.getElementById("graph_setting").style.display = "none";
    document.getElementById("discription").style.display = "block";
    document.getElementById("discripbtn").style.display = "none"
    document.getElementById("graphbtn").style.display = "block";
    document.getElementById("discription").innerHTML = model["discription"];
}

function returnGraph(){
    document.getElementById("graph").style.display = "block";
    document.getElementById("graph_setting").style.display = "block";
    document.getElementById("discription").style.display = "none";
    document.getElementById("discripbtn").style.display = "block";
    document.getElementById("graphbtn").style.display = "none";
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
    	console.log(model.time[model.time.length - 1])
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
    //xS = model.time[timepoint];
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
    	modeChange("strip");
    document.getElementById("history").style.display = "none"; 
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
    // if(document.getElementById("thining").value > 0 && document.getElementById("thining").value.match(/^-?[0-9]+$/)){ // thiningのinputが正の整数の時
    //     thining = document.getElementById("thining").value;
    //     judge.thining = true;
    // }
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
            // start_time = model.time[model.time.length - 1];
            runbtn.disabled = false;
            //stepbtn.disabled = false;
            autobtn.disabled = false;
            stopbtn.disabled = true;
            scaleChange = 1;	
            makeGraph();
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
            //stepbtn.disabled = false;
            autobtn.disabled = false;
            stopbtn.disabled = true;
	    scaleChange = 1;
            makeGraph();
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
            makeGraph();
            start_time = Math.floor(model.time[model.time.length - 1]); // 変更 10/27
            runbtn.disabled = false;
            //stepbtn.disabled = false;
            autobtn.disabled = false;
            stopbtn.disabled = true;
        }
    }
}

function stop_sim(){ // stopボタンをおした時
    document.getElementById("history").style.display = "inline-block"; 
    if(sim_style == "auto"){
        run_flag = false;
    }
    else if(sim_style == "run"){
        time = model.time[model.time.length - 1] - start_time;
        end_time = start_time + time;
//    }else if(sim_style == "step"){ #step機能は廃止でいいかも すまぬ 森 
//        time = step_num;
//        end_time = start_time + time;
//
    }
    document.getElementById("stopbtn").disabled = true;
    document.getElementById("history").style.display = "inline-block"; 

}

// simのリクエストを送る用の関数
function runSim(){
    step_num += interval;
    connect_num += 1;
    socket.emit("step", [interval, thining]);
}
