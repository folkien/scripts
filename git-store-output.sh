#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Give output .elf directory!"
    exit -1
fi

path=$1
branchFrom=$(git symbolic-ref -q HEAD)
githash=$(git rev-parse HEAD)
storeDir="store/${branchFrom}/${githash}.${path}"
mkdir -p ${storeDir}
cp -rfv ${path}/*.map ${storeDir}
cp -rfv ${path}/*.hex ${storeDir}
cp -rfv ${path}/*.bin ${storeDir}
cp -rfv ${path}/*.elf ${storeDir}

