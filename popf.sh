#!/bin/bash
ARG="$@"
if [ $# -eq 0 ] ; then 
	ARG="./"
else
	ARG="$@"
fi

# Odczytujemy sciezkę do wrzuconych plików w katalogu użytkownika
TMPDIR=`cat ~/.pushfdir`

echo "Zdjemujemy ze stosu $TMPDIR."

#Kopiujemy pliki do tymczasowego katalogu
cp -rf $TMPDIR/* $ARG

#Czyscimy
rm -rf $TMPDIR 
