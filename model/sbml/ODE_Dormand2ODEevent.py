import os
dirs = os.listdir(".") 
for afile in dirs:
    if ".eml" in afile:
        sbml     = afile.replace("eml","xml")
        emllines = open(afile).read()
        #lines    = open(sbml).read()
        if "tanh" in emllines or "sinh" in emllines or "cosh" in emllines:
        #if "Cycle" in lines or "cycle" in lines or "oscil" in lines or "Circ" in lines or "Spik" in lines:
            #emllines = emllines.replace("ODEevent","ODE_Dormand")
            #new = open(afile,"w") 
            #new.write(emllines)
            #new.close()
            print afile
