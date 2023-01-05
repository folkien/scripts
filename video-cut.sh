#/bin/bash
file="${@}"
from="00:00:00"
from=$(\
  dialog --title "Cut video from time :" \
         --inputbox "Write time in format 00:00:00" 8 40 \
         "00:00:00" \
  3>&1 1>&2 2>&3 3>&- \
)
to="00:00:30"
to=$(\
  dialog --title "Cut video to time :" \
         --inputbox "Write time in format 00:00:00" 8 40 \
         "00:00:30" \
  3>&1 1>&2 2>&3 3>&- \
)

echo "Cut from ${from} to ${to}."
ffmpeg -ss ${from} -i "${file}" -t ${to} -vcodec copy -acodec copy  -copy_unknown -map_metadata 0 Cuted${file}
echo "Created Cuted${file}."
