import commands 
import os 
import multiprocessing as mp

fileList = os.listdir("./")
xmlList  = []

for afile in fileList:
    if "BIOMD" in afile and ".xml" in afile:
	xmlList.append( afile )        

def makeeml(filename):
    i = 1
    print filename
    output = commands.getoutput("ecell3-sbml2eml " + filename )
    if "Error" in output:
        open( afile.split('.')[0] + "_error.txt", "w" ).write( output )
         
num = 0  
print xmlList 
while( num < len(xmlList) ): 
    ps = [mp.Process( target = makeeml, args = ( afile, )) for afile in xmlList[num:num+8] ]
    print afile
    num += 8
    for p in ps:
	p.start()

    for p in ps:
	p.join(300)
	if p.is_alive():
	    p.terminate()
	    print "timeout"


