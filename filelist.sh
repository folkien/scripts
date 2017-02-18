#!/bin/bash
if [ $# -lt 1 ]; then
    echo "Please give me full path to directory that should be listed."
    exit 0
fi
DIRECTORY=$1


let i=0 # define counting variable
W=() # define working array
while read -r line; do # process file by file
    let i=$i+1
    W+=($i "$line")
done < <( ls -1 ${DIRECTORY} )
FILE=$(dialog --title "List file of directory ${DIRECTORY}" --menu "Chose one" 24 80 17 "${W[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
if [ $? -eq 0 ]; then # Exit with OK
    CHOOSEN_FILE=$(ls -1 ${DIRECTORY} | sed -n "`echo "$FILE p" | sed 's/ //'`")
else
    exit 1
fi
clear
echo ${CHOOSEN_FILE}
