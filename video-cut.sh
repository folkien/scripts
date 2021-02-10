#/bin/bash
file="${@}"
from="00:00:00"
to="00:01:00"
to=$(\
  dialog --title "Cut video to time :" \
         --inputbox "Write time in format 00:00:00" 8 40 \
  3>&1 1>&2 2>&3 3>&- \
)
ffmpeg -ss ${from} -i ${file} -t ${to} -vcodec copy -acodec copy Cuted${file}
echo "Created Cuted${file}."
