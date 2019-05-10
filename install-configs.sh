#!/bin/bash
DIR=$(pwd)
machine=$(cat /etc/hostname)

#Instalacja konfiguracji XFCE4
rm -rf ~/.config/xfce4
ln -sf $DIR/.config/$machine/xfce4/ ~/.config/xfce4
 
cd $DIR
cp -rfv colors.sh /etc/
# test czy posiadamy xdotool
xdotool help
if [ $? -eq 127 ] ; then
    sudo apt-get install -yf xdotool
else
    echo "Posiadasz xdotool."
fi
