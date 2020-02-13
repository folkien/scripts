file=${@}
if [ -e ${file} ]; then
    grep -o -oa -Pe "UsedMem: [0-9]* " ${file} | cut -c 9-  > ${file}.memory.csv
else
    echo "File doesn't exists!"
fi
