#!/bin/bash
# if install is forced over current install
DIR=$(pwd)
isForce=0
[ $# -ne 0  ] && [ $1 == "-f" ] && isForce=1 && echo "Installation forced!"

# Check current install 
grep "source.*bashrc.base" /home/$USER/.bashrc &> /dev/null
if [ $? -eq 0 ] && [ ${isForce} -ne 1 ]; then
    echo "Bashrc jest już zainstalowany."
    exit 1
else
    echo "source $DIR/.bashrc.base" >> /home/$USER/.bashrc
fi

# install git prompt
git clone https://github.com/magicmonty/bash-git-prompt.git ~/Dokumenty/git/bash-git-prompt --depth=1

#Tworzymy pliki konfiguracyjny
if [ -w /etc/bashrc.conf ] ; then
    echo "INSTALLUSER=$USER" > /etc/bashrc.conf
else
    sudo touch /etc/bashrc.conf
    sudo chown $USER /etc/bashrc.conf
    echo "INSTALLUSER=$USER" > /etc/bashrc.conf
fi
