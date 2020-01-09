#!/usr/bin/python2.7
import sys

def file_len(fname):
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    return i + 1

if len(sys.argv)<2:
    print "Give file name"
    sys.exit(-1)


filepath=sys.argv[1]
outputFile="percent"+filepath
lineNumber=1
lineCount=file_len(filepath)

fwrite=open(outputFile,'w+')
with open(filepath,'r+') as fp:
   line = fp.readline()
   while line:
    fwrite.write("%2.4f %s" % (float(lineNumber*100)/lineCount,line))
    lineNumber+=1
    line = fp.readline()

fwrite.close()
