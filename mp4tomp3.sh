filename=$(echo $1 | rev | cut -c 5- | rev)
ffmpeg -i $filename.mp4 -vn  -acodec libmp3lame -ac 2 -qscale:a 4 -ar 48000 $filename.mp3
