#!/bin/bash
# resizes the window to full height and 50% width and moves into upper right corner

source /home/$USER/Dokumenty/git/scripts/.config/$(cat /etc/hostname)/variables.sh

# get width of screen and height of screen
SCREEN_WIDTH=$(xwininfo -root | awk '$1=="Width:" {print $2}')
SCREEN_HEIGHT=$(xwininfo -root | awk '$1=="Height:" {print $2}')

# new width and height
W=$(( $SCREEN_WIDTH / 2 - $RIGHTMARGIN ))
H=$(( $SCREEN_HEIGHT - 2 * $TOPMARGIN ))

# X, change to move left or right:

# moving to the right half of the screen:
#X=$(( $SCREEN_WIDTH / 2 ))
# moving to the left:
X=$RIGHTMARGIN; 

Y=$TOPMARGIN

wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz && wmctrl -r :ACTIVE: -e 0,$X,$Y,$W,$H
