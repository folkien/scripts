#!/bin/bash

for filename in "${@}"; do
    lines_prev=$(cat ${filename} | wc -l)
    lines_post=$(cat ${filename} | uniq | wc -l)

    # Drop duplicates if duplicates found
    if [ ${lines_prev} -ne ${lines_post} ]; then
        echo "File ${filename} with ${lines_prev} lines, will be uniqued to ${lines_post} lines."
        cat ${filename} | uniq > ${filename}.tmp
        mv ${filename}.tmp ${filename}
    fi
done
