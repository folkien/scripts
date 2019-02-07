#!/bin/bash
# if install is forced over current install
DIR=$(pwd)
isForce=0
[ $# -ne 0  ] && [ $1 == "-f" ] && isForce=1 && echo "Installation forced!"

# Check current install 
grep "source.*bashrc.base" /home/$USER/.bashrc &> /dev/null
if [ ${isForce} -ne 1 ] && [ $? -eq 0 ]; then
    echo "Bashrc jest już zainstalowany."
    exit 1
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
