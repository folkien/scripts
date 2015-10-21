#!/bin/bash
DIR=$(pwd)
grep "source.*bashrc.base" /home/$USER/.bashrc &> /dev/null
if [ $? -eq 0 ] ; then
    echo "Bashrc jest już zainstalowany."
else
    echo "source $DIR/.bashrc.base" >> /home/$USER/.bashrc
fi

#Tworzymy pliki konfiguracyjny
if [ -w /etc/bashrc.conf ] ; then
    echo "INSTALLUSER=$USER" > /etc/bashrc.conf
else
    sudo touch /etc/bashrc.conf
    sudo chown $USER /etc/bashrc.conf
    echo "INSTALLUSER=$USER" > /etc/bashrc.conf
fi
