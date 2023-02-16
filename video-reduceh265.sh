#/bin/bash
# Check : missing args
if [ $# -eq 0 ]; then
    echo 'Missing arguments [file] [compresion = 42]'
    exit -1
fi

# Read file
if [ $# -gt 0 ]; then
    file="$1"
fi

compression="42"
if [ $# -gt 1 ]; then
    compression="$2"
fi

echo "Reduction to h265 of file ${file}."
ffmpeg -i "${file}" -c:v libx265 -an -crf ${compression} ${file}.h265.mp4
