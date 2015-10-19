#!/bin/base
# Zapisuje katalog z konfiguracja w adekwatnym katalogu w repozystorium
# scripts, w podkatalogu danej maszyny.
#
# Argument nr 1 jest katalogiem do zapisania w .config
$DIRECTORY2SAVE=$1
mkdir -p $scripts/.config/$(cat /etc/hostname)
rsync $DIRECTORY2SAVE $scripts/.config/$(cat /etc/hostname)/$(basename $DIRECTORY2SAVE)
