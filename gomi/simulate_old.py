import ecellEX
import ecell 
import ecell.emc
import ecell.Session     
import ecell.ecs
import ecellEX 
import matplotlib.pyplot as plt
import collections
import sys
import copy
import json 

aSimulator = ecell.emc.Simulator() 
aSession   = None 
exSession  = None 
def load( modelname ):
    global aSimulator
    global aSession
    global exSession 
    aSession   = ecell.Session.Session( aSimulator )
    DMPath     = aSession.theSimulator.getDMSearchPath() 
    aSession.theSimulator.setDMSearchPath( DMPath + ":./cpp" ) 
    aSession.loadModel( "./model/" + modelname )
    exSession = ecellEX.EX( aSession ) 
    exSession.treeDictionary("/") 
    exSession.treeJson = exSession.convertDictJson( exSession.treeJson, "/" )  
    exSession.treeJson["time"] = aSession.getCurrentTime() 
 
def step( num ):
    global aSession
    global exSession
    aSession.step( num )
    #print exSession.treeDict
    exSession.treeJson = exSession.convertDictJson( collections.OrderedDict(), "/" ).copy()
    exSession.treeJson["time"] = aSession.getCurrentTime()  


def changeEntityData( idpath, newvalue ):
    global aSession 
    global exSession
    idpath = idpath.split(".")   
    if "Variable" in idpath:
	idpath.remove("Variable")
	idpath[ 0 ] = "/" 
	idpath.insert(0,"Variable")   
    
    if "Process" in idpath:
	idpath.remove("Process")
	idpath[ 0 ] = "/" 
	idpath.insert(0,"Process")  

    pathstr = ""
    for i in range( len( idpath ) - 1 ):
	pathstr += idpath[i]
	if i == 0 or i == len( idpath ) - 3:
            pathstr += ":"
        elif i == len( idpath ) - 2:
            pass 
        else:
            pathstr += "/" 
    aEntity = aSession.createEntityStub( pathstr )
    if value.isdigit(): 
    	aEntity[ idpath[-1] ] = float(value)
    else:
        aEntity[ idpath[-1] ] = float(value)
    exSession.treeJson = exSession.convertDictJson( exSession.treeJson, "/" ) 
	
while 1:
    try:
        line = sys.stdin.readline()
    except KeyboardInterrupt:
        break

    if not line:
        break

    try:
        if line == "init\n":
            command = "init"
	elif line.split(" ")[0] == "load":
	    command   =  "load"
            modelname = line.split(" ")[-1].rstrip()	
	elif line.split(" ")[0] == "step":
	    command = "step"
            n = int( line.split(" ")[1] )   
	elif line.split(" ")[0] == "change":
            command = "change"
	    path, value = line.split(" ")[1], line.split(" ")[2] 
             
    except:
        continue

    results = []
    if( command == "init" ):
        results.append( exSession.treeJson ) 
    elif ( command == "step" ):
        for i in xrange(n):
	    step( 1 )
	    results.append( exSession.treeJson )
    elif ( command == "change" ):
	changeEntityData( path, value );   
    elif ( command == "load" ):
	load( modelname )
	results.append( exSession.treeJson )  
    else:
        pass 
    sys.stdout.write(json.dumps( results ))
    sys.stdout.write("\n")
    sys.stdout.flush()

