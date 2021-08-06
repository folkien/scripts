#/bin/bash
file="${@}"
partSize="00:05:00"
partSize=$(\
  dialog --title "Cut video part size in time :" \
         --inputbox "Write time in format 00:00:00" 8 40 \
         "00:05:00" \
  3>&1 1>&2 2>&3 3>&- \
)

echo "Divide ${file} to parts of ${partSize} time."
##ffmpeg -ss ${from} -i "${file}" -t ${to}  Cuted${file}
ffmpeg -i ${file} -vcodec copy -acodec copy  -reset_timestamps 1 -segment_time ${partSize} -f segment video_part%03d.mp4
echo "Divided ${file}."
