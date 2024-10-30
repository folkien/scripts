#!/bin/bash

# Check : missing args
if [ $# -eq 0 ]; then
    echo 'Missing arguments [file] [compression = 42]'
    exit 1
fi

# First argument is the file
file="$1"
shift

# Rest of the arguments are the codec
codec="libx265 -crf 42"
if [ $# -gt 0 ]; then
    codec="$@"
fi

echo "Reduction to h265 of file ${file} with arguments : ${codec}."
ffmpeg -i "${file}" -an -c:v ${codec} "${file}.h265.mp4"
