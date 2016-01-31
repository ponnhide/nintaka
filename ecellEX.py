import ecell, ecell.emc, ecell.Session, ecell.ecs
import os,sys
import numpy as np 
import csv                       
import json
import collections
import matplotlib.pyplot as plt 
import copy
'''This class contain 3 methods other than __init__ method.These methods will help you when you use ecell3-session.

'''
class EX:
    def __init__( self, aSession ):
        self.aSession        = aSession
        self.EntitytypeList  = [ 'System','Process','Variable' ]
        self.treeDict        = None 
        self.treeDictKeys    = []
        self.PropertyList    = ['','Activity','Value']
        self.LoggerList      = []       
        self.saveEntityDict  = {}  
        self.saveStepperDict = {} 
        self.updatableList   = []
        self.updatableStubs  = []
        self.treeJson        = collections.OrderedDict() 

    def getAllEntityList( self,SystemPath ): 
        '''This method returns list of entities in Systempath.
        
        If you give appropriate Systempath as argument to this function,it returnes three dementional list.
        The first element of the list is Systempath given as argument and the second is two dementional list containing FullID of all entities in System specifed argument.
        The first element of the second element is list containing FullID of Systme type entities, the second is list containing FullID of Process type entities and the last is list  containing FullID of Variable type entities.
        '''
        allEntityList  = [ SystemPath,[] ]    
        for i in range( len( self.EntitytypeList ) ):
            allEntityList[1].append( list( self.aSession.getEntityList( self.EntitytypeList[i],SystemPath ) ) )
            for j in range( len( allEntityList[1][i] ) ):
                allEntityList[1][i][j] = self.EntitytypeList[i] + ':' + SystemPath + ':' + allEntityList[1][i][j]     
        return allEntityList  


    def treeDictionary( self,SystemPath ):
        '''This method return a dictionary.The keys of the dictionary are Systempath and the values are FullID of all entities in System specifed key.

        The structure of the method is complex. So I can't explain it in English.
        I'm sorry.
        '''
        FE = self.getAllEntityList( SystemPath )  #First element
        self.treeDict = []
        self.treeDict.append( FE )
        SystemList = FE[1][0]
        self.treeDictKeys.append( FE[0] ) 
        for i in xrange( len( SystemList ) ):
            SystemList[i] = SystemList[i].replace( ':','' )
            SystemList[i] = SystemList[i].replace( 'System','' )
            self.treeDictKeys.append( SystemList[i] )
        
        while len( SystemList ) > 0:
            Next_SystemList = []
            for i in xrange( len( SystemList ) ) :
                NE = self.getAllEntityList( SystemList[i] ) #Next element
                self.treeDict.append( NE )
                
                for j in xrange( len( NE[1][0] ) ):
                    Next_SystemList.append( NE[1][0][j] )
                    length = len( Next_SystemList ) - 1 
                    Next_SystemList[ length ] = Next_SystemList[ length ].split(':')

                    Next_SystemList[ length ] = Next_SystemList[ length ][1]  + '/' + Next_SystemList[ length ][2]
                    self.treeDictKeys.append( Next_SystemList[ length ] )

            SystemList = Next_SystemList

        self.treeDict = collections.OrderedDict( self.treeDict )      

    def convertDictJson( self, treeJson, root ):
        #branch = {"System":None, "Process":None, "Variable":None }
        #treeJson[ newroot ] = collections.OrderedDict() 
        branch              = collections.OrderedDict()     
        branch["Variable"]  = None
        branch["Process"]   = None 
        if root == "/":  
            newroot = "root"
            treeJson[ newroot ] = branch
        else: 
            newroot = root.split("/")[-1]
            treeJson[ newroot ] = branch   
        
        
        if len( self.treeDict[ root ][2] ) > 0:
            treeJson[ newroot ]["Variable"] = collections.OrderedDict()
            for i in range( len( self.treeDict[ root ][ 2 ] ) ): 
                aEntity      = self.aSession.createEntityStub( self.treeDict[ root ][ 2 ][ i ] )
                aEntity_key  = self.treeDict[ root ][ 2 ][ i ].split(":")[-1]
		PropertyList = aEntity.getPropertyList() 
                #use only Value property
                #All variable is rewritable
                treeJson[ newroot ]["Variable"][ aEntity_key ] = {}
                #print aEntity["Fixed"]
                #aEntity["Fixed"] = 0
                for aProperty in PropertyList:
                    if aEntity.getPropertyAttributes( aProperty )[ 0 ] and aEntity.getPropertyAttributes( aProperty )[ 1 ]:
                        if((aProperty == "Value" or aProperty == "Velocity" )and self.treeDict[ root ][ 2 ][ i ] in self.updatableList):
                            treeJson[ newroot ]["Variable"][ aEntity_key ][ aProperty ] = [aEntity[ aProperty ]] 
                            self.updatableStubs.append( [treeJson[ newroot ]["Variable"][ aEntity_key ][ aProperty ], aEntity, aProperty ])
                        else:
                            treeJson[ newroot ]["Variable"][ aEntity_key ][ aProperty ] = aEntity[ aProperty ]   
                treeJson[ newroot ]["Variable"][ aEntity_key ]["FullID"] = self.treeDict[ root ][ 2 ][ i ]       		
		          
        else:
            treeJson[ newroot ]["Variable"]   = None 
        
        if len( self.treeDict[ root ][1] ) > 0:
            treeJson[ newroot ]["Process"] = collections.OrderedDict()   
            for i in range( len( self.treeDict[ root ][ 1 ] ) ): 
                aEntity      = self.aSession.createEntityStub( self.treeDict[ root ][ 1 ][ i ] )
                aEntity_key  = self.treeDict[ root ][ 1 ][ i ].split(":")[-1]
                PropertyList = aEntity.getPropertyList() 
                #use only Value property
                treeJson[ newroot ]["Process"][ aEntity_key ] = collections.OrderedDict()
                for aProperty in PropertyList:
                    if aEntity.getPropertyAttributes( aProperty )[ 0 ] and aEntity.getPropertyAttributes( aProperty )[ 1 ]:
                        if aProperty == "Activity" and self.treeDict[ root ][ 1 ][ i ] in self.updatableList:
                            treeJson[ newroot ]["Process"][ aEntity_key ][ aProperty ] = [aEntity[ aProperty ]] 
                            self.updatableStubs.append( [treeJson[ newroot ]["Process"][ aEntity_key ][ aProperty ], aEntity, aProperty ])
                        else:
                            treeJson[ newroot ]["Process"][ aEntity_key ][ aProperty ] = aEntity[ aProperty ] 

                treeJson[ newroot ]["Process"][ aEntity_key ]["FullID"]    = self.treeDict[ root ][ 1 ][ i ] 
		treeJson[ newroot ]["Process"][ aEntity_key ]["RuleClass"] = aEntity.getClassname()
		"""
                treeJson[ newroot ]["Process"][ aEntity_key ]["Activity"] = aEntity["Activity"]
                if "Trigger" in PropertyList:
                    treeJson[ newroot ]["Process"][ aEntity_key ]["Trigger"] = aEntity["Trigger"]

                if "Expression" in PropertyList:
                    treeJson[ newroot ]["Process"][ aEntity_key ]["Expression"] = aEntity["Expression"]           """

        else:
            treeJson[ newroot ]["Process"]   = None        
        
        if len( self.treeDict[ root ][ 0 ] ) > 0:
            #treeJson[ newroot ]["System"] = {}
            for i in range( len( self.treeDict[ root ][ 0 ] ) ):
                #self.convertTreeDict( treeJson[ newroot ]["System"], self.treeDict[ root ][ 0 ][ i ] )           
                nextroot = self.treeDict[ root ][ 0 ][ i ].replace( "System:" , "").replace(":","/")   
                self.convertDictJson( treeJson[ newroot ], nextroot )   
        else:
            pass
            #treeJson[ newroot ]["System"]   = None

        self.treeJson = treeJson
        #return treeJson     
    
        
    def addTreeJson( self, treeJson, path ):
        for key in treeJson.keys():
            if(key == "Value" or  key == "Velocity" or key == "Activity") and ( isinstance( treeJson[key] ,list ) ):
                oldpath = path.split("/")
                oldpath[0] = "/"
                newpath = oldpath[-2] 
                del oldpath[-2]
                for i in range(len(oldpath)):
                    if i == 0:
                        newpath += ":" + oldpath[i]
                    elif i == len(oldpath) - 1:
                        newpath += ":" + oldpath[i] 
                    else:
                        newpath += "/" + oldpath[i] 
   
                aStub = self.aSession.createEntityStub(newpath)
                #print aStub["Fixed"]
                treeJson[key].append(aStub[key])
            else:
                if isinstance(treeJson[key], dict): 
                    nextpath = path + "/" + key
                    self.addTreeJson(treeJson[key], nextpath) 

    def addTreeJson2( self ):
        for i in range( len(self.updatableStubs) ):
            self.updatableStubs[i][0].append( self.updatableStubs[i][1][ self.updatableStubs[i][2] ] )

    def initTreeJson( self ):
        for i in range( len(self.updatableStubs) ):
            length = len( self.updatableStubs[i][0] ) 
            for j in range( length ):
                self.updatableStubs[i][0].pop()                 
    
    def createAllLogger( self ):
        '''This methods create Loggeres of all Variables and Processes under the Systempath used treedictionary methods.

        Default property of Variable is Value. So if you want to take MolaaConc forproperty, you could alter the third element of 'self.PropertyList' to MolaaConc.
        '''
        for key in self.treeDictKeys:
            properties = self.treeDict[ key ]
            for j in range( 1,3 ):
                for path in properties[j]:
                    FullPN = path + ':' + self.PropertyList[j]
                    aLogger = self.aSession.createLoggerStub( FullPN )
                    aLogger.create()
                    #aLogger.setLoggerpolicy([a,b,c,d])
                    self.LoggerList.append( aLogger )
    
    def createAllLogger2( self ):
        """
        Create LoggerStub of only active variables.
        """
        LoggereFullPNList = [] 
        for key in self.treeDictKeys:
            for path in self.treeDict[ key ][ 1 ]:   
                #print path
                aEntity = self.aSession.createEntityStub( path )

                if "Flux" in aEntity.getClassname():
                    FullPN = path + ":" + self.PropertyList[ 1 ]
                    aLogger = self.aSession.createLoggerStub( FullPN )
                    aLogger.create() 
                    LoggereFullPNList.append( FullPN )
                    self.LoggerList.append( aLogger)

                VRL = aEntity['VariableReferenceList']
                for VR in VRL:
                    if VR[ 2 ] != 0:
                        FullPN = self.EntitytypeList[ 2 ] + VR[ 1 ] + ":" + self.PropertyList[ 2 ]
                        if FullPN in LoggereFullPNList:
                            pass 
                        else:
                            aLogger = self.aSession.createLoggerStub( FullPN )
                            aLogger.create()
                            LoggereFullPNList.append( FullPN )
                            self.LoggerList.append( aLogger )

    def analysisCoEfficient( self ):
         for key in self.treeDictKeys:
            for path in self.treeDict[ key ][ 1 ]:   
                #print path
                aEntity = self.aSession.createEntityStub( path )

                if "Flux" in aEntity.getClassname():
                    self.updatableList.append( path )
                VRL = aEntity['VariableReferenceList']
                for VR in VRL:
                    if VR[ 2 ] != 0:
                        FullPN = self.EntitytypeList[ 2 ] + VR[ 1 ]
                        if FullPN in self.updatableList:
                            pass 
                        else:
                            self.updatableList.append( FullPN )

    def saveCSV( self,saveDir,args ):#args = [ FullPN,StartTime,EndTime,interval ]
        if len(args) == 1:
            Log = self.aSession.theSimulator.getLoggerData( args[0] )
        if len(args) == 2:
            args.append( self.aSession.getCurrentTime() )
            Log = self.aSession.theSimulator.getLoggerData( args[0], args[1], args[2] ) 
        if len(args) == 3:
            Log = self.aSession.theSimulator.getLoggerData( args[0], args[1], args[2] )
        if len(args) == 4:
            Log = self.aSession.theSimulator.getLoggerData( args[0], args[1], args[2],args[3] )                                     
        FullPN = args[0]
        Data  = np.matrix(Log)
        Data  = Data[:,0]
        Data  = Data.tolist()
        rabelrows = [ 'time', FullPN ]
        for i in range( len(Data) ):
            Data[i].append(Log[i][1])
        Data.insert(0,rabelrows) 
        FullPN   = FullPN.replace('/','_') 
        filename = FullPN + '.csv'
        csvfile  = open( saveDir + "/" + filename,'w')
        writer   = csv.writer(csvfile)
        writer.writerows(Data)
        csvfile.close()

    def createNewLogger( self, ID, name ):
        """
        This method create a Logger of "FullID". 
        """
        IDStub = self.aSession.createEntityStub( "Variable:" + ID ) 
        P = self.aSession.theSimulator.createEntity( "ExpressionAssignmentProcess", "Process:" + ID + name )
        V = self.aSession.theSimulator.createEntity( "Variable","Variable:" + ID + name )
        V.Value = IDStub[ "Value" ]
        P.StepperID = "PSV"
        P.VariableReferenceList = [ [ "CP",":" + ID + name, "1" ],[ "Origin",":" + ID, "0" ] ]
        P.Expression = "Origin.Value"
        L = self.aSession.createLoggerStub( "Variable:" + ID + name + ":Value" ) 
        L.create() 
        return L 
    
    def deleteNewLogger( self, ID, name ):
        self.aSession.theSimulator.deleteEntity( "Process:" + ID + name )
        self.aSession.theSimulator.deleteEntity( "Variable:" + ID + name ) 


        
    def saveAllCSV( self,filename,StartTime,EndTime,Interval ): 
        for a in range( len( self.LoggerList ) ):
            Data      = self.LoggerList[a].getData( StartTime, EndTime, Interval )  
            if len( Data ) > 2:
                break
        Data      = np.matrix(Data)
        Data      = Data[:,0]
        Data      = Data.tolist()
        rabelrows = ['time']
        shortrabelrows = ['time']

        for i in range( a, len( self.LoggerList ) ):
            Next_Data  = self.LoggerList[i].getData( StartTime, EndTime, Interval )
            rabel      = self.LoggerList[i].getName()
            if len(Next_Data) < len(Data):
                print len( Data )
                pass 
            else:
                for j in range(len(Data)):
                    Data[j].append(Next_Data[j][1])
                shortrabelrows.append( rabel ) 
                #rabel = rabel.split(':')
                #path  = rabel[0][0] + ':' + rabel[1] + ':' + rabel[2]
                #rabel[1] = rabel[1].split('/')
                #rabel[1][-1] = rabel[1][-1].replace(':','')
                #shortrabel = rabel[0][0] + '_' + rabel[1][-1] +':' + rabel[2]
                #shortrabelrows.append(shortrabel)

        Data.insert(0,shortrabelrows)
        csvfile  = open(filename,'w')
        writer   = csv.writer(csvfile)
        writer.writerows(Data)
        csvfile.close() 

    def graphAll( self, csvfile, imgDir ):
        header = open( csvfile, "r" ).readli1ne().rstrip().split(",")  
        Data = np.loadtxt( csvfile, delimiter = ",", skiprows = 1 )    
        for i in range( len( header ) - 1 ):
            fig = plt.figure( figsize = (12,6) )  
            ax  = fig.add_subplot(111)
            ax.plot( Data[:,0], Data[:,i + 1 ] ) 
            ax.set_xlabel("Time") 
            ax.set_ylabel( header[ i + 1 ].split(':')[-2].split('/')[-1]  ) 
            ax.grid('on') 
            saveName = header[ i + 1 ].replace("/","|")
            saveName = saveName.replace(":","_")
            fig.savefig( "./" + imgDir + "/" + saveName + ".png" , dpi = 200 )
            plt.close(fig)

        fig = plt.figure( figsize = (12,6) )  
        ax  = fig.add_subplot(111)   
        ax.set_xlabel("Time")      
        for i in range( len( header ) - 1 ):
            ax.plot( Data[:,0], Data[:,i + 1 ], label = header[ i + 1 ].split(':')[-2].split('/')[-1]   ) 
        saveName = header[ i + 1 ].replace("/","|")
        saveName = saveName.replace(":","_")  
        handles, labels = ax.get_legend_handles_labels()
        lgd = ax.legend( handles, labels, loc = "upper right", bbox_to_anchor=(1.2,1.0) ) 
        ax.grid('on') 
        fig.savefig( "./" + imgDir + "/" + "all" + ".png" , bbox_extra_artists=(lgd,), bbox_inches='tight', dpi = 200 )
            

    def saveStatus( self ):
        '''This method save the Value of every variable and the Activity of every process at that time.
        '''
        StepperList = self.aSession.getStepperList() 
        for Stepper in StepperList:
            aStub = self.aSession.createStepperStub( Stepper )
            aStubDict = {}
            for key2 in aStub.getPropertyList( ):
                if aStub.getPropertyAttributes( key2 )[ 1 ] == 1:
                    aStubDict[ key2 ] = aStub.getProperty( key2 ) 
                else:
                    pass 

            self.saveStepperDict[ Stepper ] = aStubDict
            del aStub 

        for key in self.treeDictKeys:
            properties = self.treeDict[ key ]
            for j in range( 1,3 ):
                for path in properties[j]:
                    aEntity = self.aSession.createEntityStub( path )
                    propertyValueDict = {}
                    for k in aEntity.getPropertyList():
                        if aEntity.getPropertyAttributes( k )[ 1 ] == 1:
                            propertyValueDict[ k ] = aEntity.getProperty( k ) 
                        else: 
                            pass 

                    self.saveEntityDict[ path ] = propertyValueDict
                    del aEntity
        


    def resetStatus( self ):
        '''This method reset the model status to the time point  saved by the saveStatus method.

        '''
        StepperList = self.aSession.getStepperList()
         
        for Stepper in StepperList:
            aStub = self.aSession.createStepperStub( Stepper )
            #print aStub[ 'StepInterval' ],
            #print self.saveStepperDict[ Stepper ][ 'StepInterval' ] i
            #if aStub[ 'ClassName' ] == 'ODE':
            #    aStub[ 'NextTime' ] = self.aSession.getCurrentTime() + self.saveStepperDict[ Stepper ][ 'StepInterval' ]

            #else:
            aStub[ 'StepInterval' ] = self.saveStepperDict[ Stepper ][ 'StepInterval' ]
            del aStub
                                   
        for key in self.treeDictKeys:
            properties = self.treeDict[ key ]
            for j in range(1,3):
                for path in properties[j]:
                    aEntity = self.aSession.createEntityStub( path )
                    propertyValueDict = self.saveEntityDict[ path ]
                    aEntity[ self.PropertyList[ j ] ] = propertyValueDict[ self.PropertyList[ j ] ]
                    #for key2 in propertyValueDict.keys():
                    #    if aEntity.getPropertyAttributes( key2 )[ 0 ] == 1:
                    #        aEntity[ key2 ] = propertyValueDict[ key2 ]
                    #    else: 
                    #        pass
                    del aEntity


    
        #for Stepper in StepperList:
        #    aStub = createStepperStub( Stepper )
        #    aStubDict = self.saveStepperDict[ Stepper ]
        #    for key3 in aStubDict.keys():
        #        if aStub.getPropertyAttributes( key3 )[ 0 ] == 1:
        #            print key3,
        #            print aStub[ key3 ],
        #            print aStubDict[ key3 ]
        #            aStub[ key3 ] = aStubDict[ key3 ]
        #        else:
        #            pass 
        #    del aStub
    '''
 
    def resetStatus( self ):

        for key in self.treeDictKeys:
            properties = self.treeDict[ key ]
            for j in range(1,3):
                for path in properties[j]:
                    aEntity = createEntityStub( path )           
                    propertyValueDict = self.saveEntityDict[ path ]    
                    aEntity[ self.PropertyList[ j ] ] =  propertyValueDict[ self.PropertyList[ j ] ]
                    del aEntity 
        
        StepperList = self.aSession.getStepperList() 
        for Stepper in StepperList:
            aStub = createStepperStub( Stepper )
            aStub[ 'StepInterval' ] = self.saveStepperDict[ Stepper ][ 'StepInterval' ]
    '''

if __name__ == '__builtin__':
    loadModel('./BIOMD0000000127.eml')
    EX = EX( self )
    print EX.getAllEntityList( '/' )
    EX.treeDictionary( '/' ) 
    print EX.treeDict
    print EX.treeDictKeys
    EX.saveStatus() 
    EX.createAllLogger()
    print 'save' 
    run( 500 )
    #EX.resetStatus() 
    #self.theSimulator.initialize() 
    #EX.createAllLogger()  
    #run( 100 )
    print 'reset'
    EX.saveAllCSV( 'ALLData_ODE.csv',0, 500,0.01 )
    print 'finish' 
    
        
"""
EX = ecellEX()
loadModel( '../Models/BIOMD0000000127.eml' )
print EX.getallEntityList( '/' )

EX.treedictionary( '/' )
print EX.treedict
print EX.treedictKeys

EX.createallLoger()
print getLoggerList()
"""

