#!/bin/bash
if [ -z ${BASHRC_INSTALLED+x} ] ; then
    echo "Install bashrc!"
else
    if [ -f ~/yakuake.ini ] ; then
        cp ~/yakuake.ini $scripts/.config/$machine/yakuake/
    fi
fi
