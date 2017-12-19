#!/bin/bash
TEXT=$1

for f in ./*
do
    # class method search and replace
    sed -i "s/\(.*\:.*)\)/${TEXT} \1/g" $f
done

