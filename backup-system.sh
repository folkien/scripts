#!/bin/bash
# Tworzymy backup katalogów systemowy poza /home
# oraz katalogami które tworzy kernel.
VERSION=`lsb_release -a | grep Rele | grep ".[0-9]\..*" -o`
KERNEL=`uname -r`
SYSTEM=$SESSION

echo "Tworze archwium w /tmp ..."
tar cJpvf /tmp/$SYSTEM-$VERSION-$KERNEL.tar.xz --totals --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/home/* /
echo "Archiwum stworzone!"


