#!/bin/bash

# Path pattern should start from *
# eg *hcc/config
pathToFind="$1"
pathToCopy="$2"
fileToCopy=$(basename ${pathToCopy})

# Files will be over written
allowOverwrite=0
if [ $# -eq 3 ]; then
    allowOverwrite=1
fi

find ./ -path ${pathToFind} | while read -r path; 
do
    if [ -e ${path}/${fileToCopy} ]; then
        if [ ${allowOverwrite} -eq 1 ]; then
            echo -ne "Overwrite! "
            cp -rfv ${pathToCopy} ${path}
        else
            echo "File ${path}/${fileToCopy} exists!"
        fi
    else
        cp -rfv ${pathToCopy} ${path}
    fi
done
