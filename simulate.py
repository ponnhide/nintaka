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
import os  
import time 
import re

aSimulator = ecell.ecs.Simulator() 
aSession   = None 
exSession  = None
mode       = 0
flag       = 0 
def load( modelname, modeltype ): #args[0] = modelrepository 
    global aSimulator
    global aSession
    global exSession
    global flag
    global mode
    aSession   = ecell.Session.Session( aSimulator )
    DMPath     = aSession.theSimulator.getDMSearchPath() 
    aSession.theSimulator.setDMSearchPath( DMPath + ":.:./cpp" ) 
    aSession.loadModel( "./model/" + modeltype + "/" + modelname )
    exSession = ecellEX.EX( aSession ) 
    exSession.treeDictionary("/") 
    exSession.analysisCoEfficient() 
    exSession.convertDictJson( exSession.treeJson, "/" )  
    exSession.treeJson["time"] = [ aSession.getCurrentTime() ] 
    exSession.treeJson["discription"] = getDiscription( modelname, modeltype )  
    ##Analyze Stepper 
    StepperList = aSession.getStepperList()
    for Stepper in StepperList:
        aStub = aSession.createStepperStub( Stepper )
        if "ODE" in aStub.getClassname() and "45" not in aStub.getClassname() and "Fixed" not in aStub.getClassname() and "MaxStepInterval" not in aStub.getPropertyList():
            aStub.setProperty("MaxStepInterval",100); 
        #if "FixedODE" in aStub.getClassname():
        #    mode = 0 
    flag = 1

def getDiscription( modelname, modeltype ):
    if modeltype == "sbml":
        sbmlfile = open( "./model/" + modeltype + "/" + modelname.replace("eml","xml") )
        sbmlnote = ""
        flag     = 0 
        for aline in sbmlfile.readlines():
            if "<notes" in aline:
                flag = 1
            if "</notes>" in aline:
                break 
            if flag == 1:
                sbmlnote += aline 
        sbmlnote = sbmlnote.replace("<body","<div id=\"discription\"")
        sbmlnote = sbmlnote.replace("</body>","</div>") 
        return sbmlnote
    
    if modeltype == "eml":
        return "none"

    if modeltype == "cellml":
        cellmlfile          = open( "./model/" + modeltype + "/" +  modelname + "/" + modelname.replace("eml","sbml") )
        cellmldocumentation = ""
        flag                = 0 
        for aline in sbmlfile.readlines():
            if "<documentation" in aline:
                flag = 1
            if "</documentation>" in aline:
                break 
            if flag == 1:
                cellmldocumentation += aline 

        cellmldocumentation = cellmldocumentation.replace("<documentation","<div id=\"discription\"")
        cellmldocumentation = cellmldocumentation.replace("</documentation>","</div>")
        return cellmldocumentation
 


def step( num ):
    global aSession
    global exSession
    aSession.step( num )
    exSession.addTreeJson2( )
    #exSession.addTreeJson( exSession.treeJson["root"], "root" ) 
    exSession.treeJson["time"].append( aSession.getCurrentTime() )  
    

def changeEntityData( idpath, aproperty, newvalue ):
    global aSession 
    global exSession
    """
    idpath = idpath.split(".")   
    if "Variable" in idpath:
	idpath.remove("Variable")
	idpath[ 0 ] = "" 
	idpath.insert(0,"Variable")   
    
    if "Process" in idpath:
	idpath.remove("Process")
	idpath[ 0 ] = "" 
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
    """
    #print value
    try: 
        aSession.setEntityProperty( idpath + ":" + aproperty, float(newvalue) ) 
    except: 
        aSession.setEntityProperty( idpath + ":" + aproperty, newvalue ) 

	#aEntity[ aproperty ] = newvalue               
    exSession.treeJson = collections.OrderedDict() 
    exSession.convertDictJson( exSession.treeJson, "/" ) 
    exSession.treeJson["time"] = [ aSession.getCurrentTime() ] 

def getModelList(): # return model list
    model_dict = {}
    model_dict["sbml"] = [x.rstrip(".eml") for x in os.listdir(os.getcwd() + "/model/sbml") if re.search("eml\Z", x)]
    model_dict["sbml_data"] = {x: getModelTitle(x, "sbml") for x in model_dict["sbml"]}
    model_dict["eml"] = [x.rstrip(".eml") for x in os.listdir(os.getcwd() + "/model/eml") if re.search("eml\Z", x)]
    model_dict["eml_data"] = {x: getModelTitle(x, "eml") for x in model_dict["eml"]}
    return model_dict

def getModelTitle(model_name, model_type): # noko
    return_data = ["", ""]
    if model_type == "sbml":
        try:
            model_name = "model/sbml/" + model_name + ".xml"
            pbmd = 0
            with open(model_name, "r") as rf:
                flag = 0
                for line in rf:
                    if re.search("<model[\w \"]", line): # get model title
                        line = re.split("name=", line)
                        line = re.split("\"", line[1])
                        return_data[0] = line[1].strip()

                    elif not return_data[1] and re.search("http://identifiers.org/pubmed/[0-9]*", line): # get pubmed id
                        line = re.split("http://identifiers.org/pubmed/", line)
                        line = re.split("\"", line[1])
                        return_data[1] = line[0].strip()

                    elif not return_data[1] and re.search("http://www.ncbi.nlm.nih.gov/pubmed/[0-9]*", line): # get pubmed id
                        line = re.split("http://www.ncbi.nlm.nih.gov/pubmed/", line)
                        line = re.split("\"", line[1])
                        return_data[1] = line[0].strip()

                    if return_data[0] and return_data[1]:
                        break

            return return_data

        except:
            return return_data
    else:
        return return_data

def closeSession():
    sys.exit();

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
            exSession.treeJson = collections.OrderedDict()
            exSession.convertDictJson( exSession.treeJson, "/" ) 
            exSession.treeJson["time"] = [ aSession.getCurrentTime() ] 

        elif line.split(" ")[0] == "load":
            command   =  "load"
            loaded    = 1
            modelname = line.split(" ")[1]
            modeltype = line.split(" ")[2].rstrip() 	

        elif line.split(" ")[0] == "step":
            command = "step"
            n = int( line.split(" ")[1] )                               
            m = int( line.split(" ")[2] ) 
            #exSession.treeJson = collections.OrderedDict() 
            #exSession.convertDictJson( exSession.treeJson, "/" )
            if( loaded == 0 ):
                exSession.initTreeJson()
                exSession.treeJson["time"] = []
            else:
                loaded = 0

        elif line.split(" ")[0] == "change":
            line = line.rstrip()
            command = "change"
            path, aproperty, value = line.split(" ")[1], line.split(" ")[2], line.split(" ")[3]

        elif line.split(" ")[0] == "getList":
            command = "getList"

        elif line.split(" ")[0] == "exit":
            command = "exit"

    except:
        continue

    try:
        if(command == "init"):
            pass

        elif(command == "step"):
            l = n/m 
            #time1 = time.time() 
            for i in xrange(l):
                step(m)
            if n > l*m:
                step(n-(l*m))
            #time2 = time.time() 
            result = exSession.treeJson

        elif(command == "change"):
            changeEntityData( path, aproperty, value );   
            result = "{changed:1}"

        elif(command == "load"):
            if flag == 1:
                del aSimulator
                del aSession
                del exSession
                aSimulator = ecell.ecs.Simulator()
                aSession = None
                exSession = None
            load( modelname, modeltype )  
            result = exSession.treeJson

        elif command == "getList":
            result = getModelList()

        elif(command == "exit"):
            closeSession() 

        else:
            pass

    except:
        if command == "exit":
           sys.exit();
        else:
            continue
	 
    sys.stdout.write(json.dumps( result ))
    sys.stdout.write("\n")
    sys.stdout.flush()

