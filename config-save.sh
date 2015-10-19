#!/bin/bash
# Zapisuje katalog z konfiguracja w adekwatnym katalogu w repozystorium
# scripts, w podkatalogu danej maszyny.
#
# Argument nr 1 jest katalogiem do zapisania w .config
DIRECTORY2SAVE=$1

# Sprawdzanie czy ostatni znak $DIRECTORY2SAVE to /
#
if [[ $DIRECTORY2SAVE =~ /$ ]] ; then
    mkdir -p $scripts/.config/$(cat /etc/hostname)
    rsync -r --progress $DIRECTORY2SAVE $scripts/.config/$(cat /etc/hostname)/$(basename $DIRECTORY2SAVE)
else
    echo "Dodaj / na koncu ciagu wejsciowego."
fi
