#! /bin/bash
bnotify-send-all(){
    text="${@}"
    for p in $(pgrep gconf-helper); do
        dbus=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$p/environ | sed 's/DBUS_SESSION_BUS_ADDRESS=//')
        user=$(grep -m 1 -z USER /proc/$p/environ | sed 's/USER=//')
        dply=$(grep -z DISPLAY /proc/$p/environ | sed 's/DISPLAY=//')
        sudo -u $user sh -c "DBUS_SESSION_BUS_ADDRESS=\"$dbus\" DISPLAY=\"$dply\" notify-send \"Powiadomienie\" \"$text\""
    done
}

bnotify-send-all $@ &> /dev/null
