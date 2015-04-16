#!/bin/bash
# Tworzymy backup katalogów systemowy poza /home
# oraz katalogami które tworzy kernel.
VERSION=`lsb_release -a | grep Rele | grep ".[0-9]\..*" -o`
KERNEL=`uname -r`
SYSTEM=$SESSION

if [ "$#" -eq 0 ] ; then
	echo "Prosze podać argument np all - cały backup, none - każdy folder osobno."
	exit 0
fi

echo "Tworze archwium w /tmp ..."
if [ $1 = "all" ] ; then
	tar cJpvf /tmp/$SYSTEM-$VERSION-$KERNEL.tar.xz  --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/home/* /
else
	tars /usr   /tmp/usr$SYSTEM-$VERSION-$KERNEL.tar.xz  
	tars /etc   /tmp/etc$SYSTEM-$VERSION-$KERNEL.tar.xz  
	tars /lib   /tmp/lib$SYSTEM-$VERSION-$KERNEL.tar.xz  
	tars /lib32   /tmp/lib32$SYSTEM-$VERSION-$KERNEL.tar.xz  
	tars /lib64   /tmp/lib64$SYSTEM-$VERSION-$KERNEL.tar.xz  
	tars /boot   /tmp/boot$SYSTEM-$VERSION-$KERNEL.tar.xz  
	tars /usr   /tmp/usr$SYSTEM-$VERSION-$KERNEL.tar.xz  
	tars /var  /tmp/var$SYSTEM-$VERSION-$KERNEL.tar.xz  
	tars /opt  /tmp/opt$SYSTEM-$VERSION-$KERNEL.tar.xz  
fi
echo "Archiwum stworzone!"


