# Creates empty video
length=1
filepath="empty.avi"

if [ $# -eq 0 ]; then
    echo "Add arguments [path] [length in seconds]!"
    exit -1
fi

if [ $# -eq 1 ]; then
    filepath="${1}"
fi

if [ $# -eq 2 ]; then
    filepath="${1}"
    length="${2}"
fi

ffmpeg -t ${length} -s 640x480 -f rawvideo -pix_fmt rgb24 -r 10 -i /dev/zero ${filepath}
