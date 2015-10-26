#!/bin/bash
if [ -z ${BASHRC_INSTALLED+x} ] ; then
    echo "Install bashrc!"
else
    cp $scripts/.config/$machine/yakuake/ ~/yakuake.ini
    echo "Yakuake.ini loaded."
fi
