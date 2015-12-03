import os 
for i in range( 166, 570 ):
    os.system("wget -O " + "BIOMD0000000" + str(i) + ".xml" + " https://www.ebi.ac.uk/biomodels-main/download?mid=BIOMD0000000" + str(i)) 
