file=${@}
grep -o -oa -Pe "UsedMem: [0-9]* " ${file} | cut -c 9-  > ../${file}.memory.csv
