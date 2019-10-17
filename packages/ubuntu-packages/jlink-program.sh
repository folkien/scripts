#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Too few parameters! [file] [processor]"
fi

file="${1}"
processor="${2}"

cat > jlink.tmpl << EOF
si SWD
speed auto
device ${processor}
loadbin ${file}, 0x08000000
verifybin ${file}, 0x08000000
q
EOF

JLinkExe jlink.tmpl
rm -rf jlink.tmpl


