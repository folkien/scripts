#!/bin/bash
ARG="$@"

echo "Wrzucam na stos $ARG."
#Kopiujemy pliki do tymczasowego katalogu
TMPDIR=`mktemp -d`
cp -rf $@ $TMPDIR/

# Zapisujemy sciezkę do wrzuconych plików w katalogu użytkownika
echo $TMPDIR > ~/.pushfdir
