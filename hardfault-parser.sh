#!/bin/bash

if [ !  $# -eq 2 ]; then
    echo "Give (website) (.elf)"
    exit 1
fi

website=$1
elfFile=$2
wget $1 -O hf.log
wait
grep  "0x08" hf.log | while read -r line ;
do
    hash=$(echo ${line} | grep "0x08.*")
    echo "# line ${line}."
    arm-none-eabi-addr2line -a -f -C -p -e ${elfFile} -i ${hash}
done
