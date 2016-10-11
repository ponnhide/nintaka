var socket = io();
var commcount = 0;
var viewModel = "sbml";
var pageNum = 1;
var pageLen = 10;
var models;
var pageInterval = 50;

socket.on("getList", function(model_list){
    var model_length = [model_list["sbml"].length, model_list["eml"].length];

    if(commcount == 0){ // 通信回数が０なら，最初のページを表示
        models = model_list;
        moveToPage(1);
    }else{ // それ以外はmodelsに追加
        Array.prototype.push.apply(models["sbml"], model_list["sbml"]);
        Object.assign(models["sbml_data"], model_list["sbml_data"]);
        Array.prototype.push.apply(models["eml"], model_list["eml"]);
        Object.assign(models["eml_data"], model_list["eml_data"]);
    }

    commcount += 1;
    
    if(model_length[0] == 50 || model_length[1] == 50){ // まだ通信できるならする
        init();
    }else{ // 通信できなくなったら，pageの長さを表示
        pageLen = parseInt(Math.ceil(models[viewModel].length / pageInterval));
        document.getElementById("modellen").textContent = pageLen;
    }
});

function submitModel(name,repo){
    console.log(name + "" + repo) 
	localStorage.setItem("modelName", name);
	localStorage.setItem("modelType" , repo); //hideto 
	location.href = "./simulation.html";
}

function init(){
    socket.emit("getList", []);
}

function changeModel(){ // viewModelの変更
    var obj = document.modelq.modelselect;
    var index = obj.selectedIndex;
    viewModel = obj.options[index].value;
    pageLen = parseInt(Math.ceil(models[viewModel].length / pageInterval));
    document.getElementById("modellen").textContent = pageLen;
    moveToPage(1);
}

function checkPage(num){ // 次ページ，前ページが有るかどうか
    document.getElementById("first").style.visibility = "visible";
    document.getElementById("prev").style.visibility = "visible";
    document.getElementById("next").style.visibility = "visible";
    document.getElementById("last").style.visibility = "visible";
    if(num == 1){
        document.getElementById("first").style.visibility = "hidden";
        document.getElementById("prev").style.visibility = "hidden";
    }
    if(num == pageLen){
        document.getElementById("next").style.visibility = "hidden";
        document.getElementById("last").style.visibility = "hidden";
    }
}

function changePage(type){ // first, prev, next, last, page
    if(type == 1){
        moveToPage(1);
    }else if(type == 2){
        moveToPage(pageNum - 1);
    }else if(type == 3){
        moveToPage(pageNum + 1);
    }else if(type == 4){
        moveToPage(pageLen);
    }else if(type == 5){
        moveToPage(parseInt(document.getElementById("pagenum").value));
    }
}


function moveToPage(num){ // pageの移動
    var par = document.getElementById("modelsTable");
    var model_name, model_title, pubmed;
    if(parseInt(num) <= pageLen && 0 < parseInt(num)){
        pageNum = num;
        checkPage(num);
        par.innerHTML = "";
        for(var i = (num-1) * pageInterval;i < num * pageInterval; i++){
                if(models[viewModel].length > i){
                var inp_str = "<tr>";
                model_name = models[viewModel][i];
                inp_str += "<td onclick=\"submitModel('" + model_name + ".eml', '"+ viewModel + "')\" class='M_ID'>" + model_name + "</td>";
                model_title = models[viewModel + "_data"][model_name][0];
                inp_str += "<td class='M_Ti'>" + model_title + "</td>";
                pubmed = models[viewModel + "_data"][model_name][1];
                inp_str += "<td class='M_Pu'><a href='http://identifiers.org/pubmed/" + pubmed + "'>" + pubmed + "</a></td>"; 
                inp_str += "</tr>";
                par.innerHTML += inp_str;
            }
        }
    }
    document.getElementById("pagenum").value = pageNum;
}
