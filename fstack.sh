#!/bin/bash

# Odczytujemy sciezkę do wrzuconych plików w katalogu użytkownika
TMPDIR=`cat  ~/.pushfdir`
ls $TMPDIR/* 

