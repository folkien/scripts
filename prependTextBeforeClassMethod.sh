#!/bin/bash
TEXT=$1

for f in ./*.cpp
do
    echo "Parsing $f."
    # class method search and replace
    sed -i "s/\(.*\:\:.*(.*)\s$\)/${TEXT} \1/g" $f
done

