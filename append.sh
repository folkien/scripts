#!/bin/bash
if [ $# -ne 2 ] ; then
    echo "Podano $# argumentów. Wymagane to : append (tekst) (plik)."
    exit 1
fi
TEXT=$1
FILE=$2
echo $TEXT >> $FILE
