#!/bin/bash
#kopiowanie z progressem, wymaga zainstalowanego rsync'a
rsync --progress -a $1 $2

command_exists () {
    type "$1" &> /dev/null ;
}

if command_exists pyNotify ; then
	pyNotify "Copy : Zakończono kopiowanie $1 do $2."
fi
