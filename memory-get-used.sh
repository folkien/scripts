file=${@}
if [ -e ${file} ]; then
    grep -o -a -e "\[.*\] UsedMem: [0-9]*" ${file} > ${file}.memory.csv
    sed -i "s/\] UsedMem://g" ${file}.memory.csv
    sed -i "s/\[//g" ${file}.memory.csv
else
    echo "File doesn't exists!"
fi
