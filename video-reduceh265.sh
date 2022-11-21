#/bin/bash
file="${@}"

echo "Reduction to h265 of file ${file}."
ffmpeg -i "${file}" -c:v libx265 -an -crf 32 ${file}.h265.mp4
