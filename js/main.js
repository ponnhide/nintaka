function submitModel(name,repo){
    	console.log(name + "" + repo) 
	localStorage.setItem("modelName", name);
	localStorage.setItem("modelType" , repo); //hideto 
	location.href = "./simulation.html";
}
