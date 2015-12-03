var env = process.env
var express = require("express")
var app = express()
var http = require("http").Server(app);
var io = require("socket.io").listen( http );
var spawn = require("child_process").spawn;
var path = require('path')
app.use(express.static( path.join( __dirname, '/' ) ) )
//app.use('css', express.static(__dirname + '/css/'))  
app.get('/', function (req, res) { 
   console.log('hoge')
   res.sendFile(__dirname + "/index.html");
});

http.listen(3000, function() {
    console.log("listening on *:3000");
});

io.on("connection", function(socket) {
    var child = spawn("python", ["simulate.py"] );
    var command = "";
    var data = ""
    child.stdout.on("data", function(chunk) {
	//console.log(chunk);
        data += chunk.toString();
    	try{ 
	    obj = JSON.parse(data)
	    if(command == "load"){
	    	socket.emit("load", obj);
	    }else if (command == "step"){
		socket.emit("step", obj);
	    }else if (command == "change"){
	    	socket.emit("change", obj) 
	    } 
           data = "";
	}catch(e){} 
    });

    socket.on("load", function(modelinfo) {
	console.log("Load model file: " + modelinfo[0] + " " + modelinfo[1]);
	child.stdin.write("load " + modelinfo[0] + " " + modelinfo[1] + "\n");
    	command = "load";
    });

    socket.on("step", function(nums) {
	console.log("Step simulation by: " + nums[0] + " steps");
	child.stdin.write("step " + nums[0] + " " + nums[1] + "\n");
    	command = "step";
    });

    socket.on("change",function(values) {
	console.log( values[0],values[1],values[2] ); 
    	child.stdin.write("change " + values[0] + " " + values[1] + " " + values[2] + "\n")
	command = "change";
    });  

    socket.on("disconnect", function() {
	console.log("Close session");
        child.stdin.end(); 
    });  
    
});

function listify(obj) {
    if(obj === Object(obj)) {
        for(var key in obj) {
            if(key === "Activity" || key === "Velocity" || key === "Value" || key === "time") {
                obj[key] = [obj[key]];
            } else {
                listify(obj[key]);
            }
        }
    }

    return obj;
}

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
}
