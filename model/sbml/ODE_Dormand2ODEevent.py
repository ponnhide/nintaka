import os
dirs = os.listdir(".") 
for afile in dirs:
    if ".eml" in afile:
        lines = open(afile).read()
        if "ODE_Dormand" in lines:
            lines.replace("ODE_Dormand","ODEevent")
            new = open(afile,"w") 
            new.write(lines)
            new.close()
            print afile
