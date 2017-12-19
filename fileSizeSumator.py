#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
# S.Paszko
# J.Slimok
# Elzab 2017
import os, random, argparse, time, sys, re, operator

#GLOBALS
#dictionary with sections size
sections = {}
#dictionary with code files
files = {}

# Create virtual file system which could be easily visualized by fileLight
scriptdirectory = os.path.dirname(os.path.realpath(__file__))
parser = argparse.ArgumentParser()
parser.add_argument("-i", "--inputfile", 	type=str, 		 		required=False)
args = parser.parse_args()

#Otwieramy plik
if args.inputfile:
        if os.path.exists(args.inputfile):
                        if os.access(args.inputfile, os.R_OK):
                            #otwieramy klucz
                            myfile = open(args.inputfile, 'r')
                            content = myfile.readlines()
                            myfile.close()
                        else:
                            sys.exit("Brak dostępu do pliku! Spróbuj wykonać polecenie jako root.")
        else:
            print "File doesn't exist."
            sys.exit(1)

# you may also want to remove whitespace characters like `\n` at the end of each line
content = [x.strip() for x in content]

#regex addres is flash address, qspi not analyzed
reCompiledObject = re.compile("^\s*0x0+8.*0x.*o$")
reHex = re.compile("0x[0-9A-Fa-f]*")

mapOfFiles = {}
totalFlashUsage = 0

# Parsowanie pliku
for index in range(len(content)):
    line = content[index]
    findCompiledObject = reCompiledObject.search(line)
    if findCompiledObject:
        findAddress = reHex.search(line)
        findSize = reHex.search(line, findAddress.end())
        fileSize = int(findSize.group(0), 16)
        fileName = line[findSize.end():]
        if not fileName in mapOfFiles:
            mapOfFiles[fileName]=0
        mapOfFiles[fileName]+=fileSize
        totalFlashUsage += fileSize
#        print "Size : ", mapOfFiles[fileName], "File : ", fileName

sorted_x = sorted(mapOfFiles.items(), key=operator.itemgetter(1), reverse=True)

print "FLASH usage (TOTAL = ",totalFlashUsage ," bytes):"
for item in sorted_x:
    print "{:8}".format(item[1]), "bytes = ", item[0]
    totalFlashUsage += item[1]
