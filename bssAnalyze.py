#!/usr/bin/python2.7
import sys, re
fname = sys.argv[-1]

currentBssName=0
currentBssAddress=0
currentBssSize=0
checkedLineNumber=0

#############################################
def bssAnalyze(line):
    global currentBssName
    global currentBssAddress
    global currentBssSize
    global checkedLineNumber

    if (checkedLineNumber == 0):
        #BSS
        resultBss = re.search("\.bss[A-Z.a-z_0-9]*",line)
        # if true then everything is in one line
        if (resultBss != None):
            currentBssName=resultBss.group(0)
            #Address
            resultAddress = re.search("0x.*",line)
            if (resultAddress != None):
                currentBssAddress=resultAddress.group(0)[:18]
                #Size and filename
                print resultAddress.group(0)[18:] + " - " + currentBssName
            else:
                checkedLineNumber=1
    else:
        #if address and size are in second line
        #Address
        resultAddress = re.search("0x.*",line)
        if (resultAddress != None):
            currentBssAddress=resultAddress.group(0)[:18]
            #Size and filename
            print resultAddress.group(0)[18:] + " -- " + currentBssName
        checkedLineNumber=0
#############################################

#main
#############################################
with open(fname) as f:
    content = f.readlines()
# you may also want to remove whitespace characters like `\n` at the end of each line
content = [x.strip() for x in content]

for line in content :
    bssAnalyze(line)
#############################################
