#!/bin/bash
# This script is cmd.exe cheater
arguments=" "
for item in "${@:2}"
do
    arguments="${arguments} ${item}"
done

# run bash with cleared arguments
bash ${arguments}
