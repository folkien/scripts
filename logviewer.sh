#! /bin/bash

LOGFILE=${1:-/var/log/messages}

PARSER='{font=""; color="#FFFFFF"}; \
/kernel/ {font="italic"}; \
/warn/ {color="#FFF4B8"}; \
/error/ {color="#FFD0D8"}; \
OFS="\n" {print $1 " " $2, $3, $4, substr($5,0,index($5,":")-1), \
substr($0,index($0,$6)), font, color; fflush()}'

tail -f $LOGFILE | awk "$PARSER" | \
yad --title="Log viewer" --window-icon=logviewer \
    --button=gtk-close --geometry 600x350 \
    --list --text="Content of $LOGFILE" \
    --column Date --column Time --column Host \
    --column Tag --column Message:TIP \
    --column @font@ --column @back@

exit $?
