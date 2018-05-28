#!/bin/bash
source /etc/messages.sh
while true; do
    merror "Please disable RAM consuming applications."
    read -p "Applications disabled? [y/n] : " yn
    case $yn in
        [Yy]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done
minfo "Memory statistics before."
echo "----------------------------------"
free -m
echo "----------------------------------"
minfo "Removing swap."
sudo swapoff -a
minfo "Installing swap back."
sudo swapon -a
minfo "Memory statistics after."
echo "----------------------------------"
free -m
echo "----------------------------------"
