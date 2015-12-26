import os
import re 
def makeModelRepo( ):
    emlModelList  = os.listdir( "./model/sbml" )
    sbmlModelList = os.listdir( "./model/sbml" ) 
    repobody  = ( "<table id='Modelrepo'>\n"
                  "    <tr>\n"    
                  "         <th>Model ID</th>\n"
                  "         <th>Model Titile</th>\n" 
                  "         <th>PMID</th>\n" 
                  "    </tr>\n"
                  "%s"
                  "</table>\n" )
    modelrepo = ""
    for asbml in sbmlModelList:
        if "BIOMD" in asbml and ".xml" in asbml:
            asbml = asbml.replace(".xml",".eml")   
            #print asbml
            if asbml in emlModelList:
                asbml      = asbml.replace(".eml",".xml")
                asbmllines = open( "./model/sbml/" + asbml, "r" ).readlines()
                asbml      = asbml.replace(".xml",".eml") 
                asbmlhtml  = ( "    <tr>\n"
                               "          <td onclick=\"submitModel('%s','sbml')\">%s</td>\n"
                               "          <td>%s</td>\n"
                               "          <td>%s</td>\n" 
                               "    </tr>\n" )
                dctitleFlag  = 0
                pubtitleFlag = 0
                title   = ""
                pubtitle = ""
                for aline in asbmllines:
                    if "<model" in aline:
                        aline = aline.split("\"")
                        #print aline
                        for i in range( len( aline ) ):
                            if "name" in aline[i]:
                                title = aline[ i+1 ]
                                break 

                    if "resource" in aline and ".org/pubmed" in aline:
                        #print aline
                        pmurl = aline.split("\"")[1]  
                        pmid  = pmurl.split("/")[-1]  
                        pubtitle = "<a href=" + pmurl + ">" + str( pmid ) + "</a>"

                #print pubtitle
                asbmlhtml = asbmlhtml % ( asbml, asbml.replace(".eml",""), title, pubtitle )
                modelrepo += asbmlhtml
                title    = ""
                pubtitle = ""    
    repobody =  repobody % modelrepo
    return repobody

f   = open("index_new.html","w") 
html = ( 
"<html>\n"
"<head>\n"
"    <title>Webbs protoType</title>\n" 
"    <meta http-equive=\"content-type\" content=\"text/html; charset=utf-8\">\n"
"    <link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\">\n"     
"    <script type='text/javascript' src='./main.js'></script>\n" 
"</head>\n"
"<body>\n"
"    <form action=\"/cgi-bin/webbs.py\" method=\"POST\" name=\"submit\">\n"
"	<input type=\"text\" name=\"name\" /> <input type=\"submit\" name=\"send\" />\n" 
"    </form>\n"  
"   %s"
"</body>\n"
"</html>\n" )
modelrepo = makeModelRepo() 
html = html % modelrepo
f.write( html ) 

    
