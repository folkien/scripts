#/bin/bash

# Read file
if [ $# -gt 0 ]; then
    file="$1"
fi


echo "No audio compression to h265 ${file}."
ffmpeg -i "${file}" -c:v libx265 -an ${file}.noaudio.h265.mp4
