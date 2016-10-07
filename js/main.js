var socket = io();
var commcount = 0;

socket.on("getList", function(model_list){
    var inp_str;
    var model_name;
    var model_title;
    var pubmed;
    var model_length = [model_list["sbml"].length, model_list["eml"].length];
    var sbmlPar = document.getElementById("biomodels");
    var emlPar = document.getElementById("uploadmodels");

    if(commcount == 0){ // 通信回数が０なら初期化
        sbmlPar.innerHTML = "<tr><th>Model ID</th><th>Model Title</th><th>PMID</th></tr>";
        emlPar.innerHTML = "<tr><th>Model ID</th><th>Model Title</th><th>PMID</th></tr>";
    }

    for(var i = 0; i < model_list["sbml"].length; i++){
        inp_str = "<tr>";
        model_name = model_list["sbml"][i];
        inp_str += "<td onclick=\"submitModel('" + model_name + ".eml', 'sbml')\">" + model_name + "</td>";
        model_title = model_list["sbml_data"][model_name][0];
        inp_str += "<td>" + model_title + "</td>";
        pubmed = model_list["sbml_data"][model_name][1];
        inp_str += "<td><a href='http://identifiers.org/pubmed/" + pubmed + "'>" + pubmed + "</a></td>"; 
        inp_str += "</tr>";
        sbmlPar.innerHTML += inp_str;
    }

    for(var i = 0; i < model_list["eml"].length; i++){
        inp_str = "<tr>";
        model_name = model_list["eml"][i];
        inp_str += "<td onclick=\"submitModel('" + model_name + ".eml', 'eml')\">" + model_name + "</td>";
        model_title = model_list["eml_data"][model_name][0];
        inp_str += "<td>" + model_title + "</td>";
        pubmed = model_list["eml_data"][model_name][1];
        inp_str += "<td><a href='http://identifiers.org/pubmed/" + pubmed + "'>" + pubmed + "</a></td>"; 
        inp_str += "</tr>";
        emlPar.innerHTML += inp_str;
    }

    commcount += 1;
    
    if(model_length[0] == 50 || model_length[1] == 50){
        init();
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

function table_switch(id){
    var table = document.getElementById(id);
    if(table.style.display == "table"){
        table.style.display = "none";
    } else {
        table.style.display = "table";
    }
}
