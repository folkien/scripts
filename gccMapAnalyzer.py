#!/usr/bin/python2.7
# -*- coding: utf-8 -*-
import os, random, argparse, time, sys, re

#GLOBALS
#dictionary with sections size
sections = {}
#dictionary with code files
files = {}

# Create virtual file system which could be easily visualized by fileLight
def createVirtualFile(section, filePath, fileName, fileSize):
    # remove '/' character
    if filePath[0] == '/':
        filePath = filePath[1:]
    # create all directories
    path = "virtualFS/"+section+"/"+filePath
    os.makedirs(path)
    # create file
    f = open(path+fileName, 'w')
    f.write('\0' * fileSize)
    f.close()

def storeElement( section, address, size, filePath ):
    # format section name
    section = section[1:len(section)-1]
    # change size to decimal integer
    size = int(size,0)
    # store size
    if section in sections:
        sections[section] += size
    else:
        sections[section] = size
    #Store file
    fileKey = section+":"+filePath
    if fileKey in files:
        files[fileKey] += size
    else:
        files[fileKey] = size


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

#regex generating
reSection = re.compile("^[ \t]*\.[a-z_]*[ .]")
reHex = re.compile("0x[0-9A-Fa-f]*")

# Parsowanie pliku
for index in range(len(content)):
    line = content[index]
    # look for a section
    findSection = reSection.search(line)
    if findSection:
        findAddress = reHex.search(line)

        # check same line
        if findAddress:
            findSize = reHex.search(line, findAddress.end())
            fileName = line[findSize.end():]
            #match
            storeElement(findSection.group(0), findAddress.group(0), findSize.group(0), fileName)
            print "Line:", index, "Section :", findSection.group(0), "Address : ", findAddress.group(0), "Size : ", findSize.group(0), "File : ", fileName

        # check next line
        else:
            line = content[index+1]
            findAddress = reHex.search(line)
            if findAddress:
                findSize = reHex.search(line, findAddress.end())
                fileName = line[findSize.end():]
                index = index + 1 # jump line
                #match
                storeElement(findSection.group(0), findAddress.group(0), findSize.group(0), fileName)
                print "Line:", index, "Section :", findSection.group(0), "Address : ", findAddress.group(0), "Size : ", findSize.group(0), "File : ", fileName

print sections
print files
