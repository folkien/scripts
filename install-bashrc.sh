#!/bin/bash
DIR=$(pwd)
echo "source $DIR/.bashrc.base" >> /home/$USER/.bashrc

#Tworzymy pliki konfiguracyjny
sudo touch /etc/bashrc.conf
sudo chown $USER /etc/bashrc.conf
echo "INSTALLUSER=$USER" > /etc/bashrc.conf
