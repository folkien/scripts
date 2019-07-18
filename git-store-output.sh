#!/bin/bash

if [ $# -lt 1 ]; then
    echo "Give directory!"
fi
path=$1
hash=$(git rev-parse HEAD)
mkdir -p store/${hash}.${path}
cp -rfv ${path}/*.map store/${hash}.${path}/
cp -rfv ${path}/*.hex store/${hash}.${path}/
cp -rfv ${path}/*.bin store/${hash}.${path}/
cp -rfv ${path}/*.elf store/${hash}.${path}/

