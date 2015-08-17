#!/bin/bash
# Tworzymy backup katalogów systemowy poza /home
# oraz katalogami które tworzy kernel.
VERSION=`lsb_release -a | grep Rele | grep ".[0-9]\..*" -o`
KERNEL=`uname -r`
SYSTEM=$SESSION
WORKDIR=/tmp
BACKUPDIR=/home/spasz/backup

if [ "$#" -eq 0 ] ; then
	echo "Prosze podać argument np all - cały backup, none - każdy folder osobno."
	exit 0
fi

echo "Tworze archwium w $WORKDIR ..."
if [ $1 = "all" ] ; then
	tar cJpvf $WORKDIR/$SYSTEM-$VERSION-$KERNEL.tar.xz  --exclude=/dev/* --exclude=/proc/* --exclude=/sys/* --exclude=$WORKDIR/* --exclude=/home/* /
else
	echo "etc"
	tars /etc   $WORKDIR/etc$SYSTEM-$VERSION-$KERNEL.tar.xz  
	mv -fv $WORKDIR/etc$SYSTEM-$VERSION-$KERNEL.tar.xz $BACKUPDIR &
	echo "usr"
	tars /usr   $WORKDIR/usr$SYSTEM-$VERSION-$KERNEL.tar.xz  
	mv -fv $WORKDIR/usr$SYSTEM-$VERSION-$KERNEL.tar.xz $BACKUPDIR &
	tars /lib   $WORKDIR/lib$SYSTEM-$VERSION-$KERNEL.tar.xz  
	mv -fv $WORKDIR/lib$SYSTEM-$VERSION-$KERNEL.tar.xz $BACKUPDIR &
	tars /lib32   $WORKDIR/lib32$SYSTEM-$VERSION-$KERNEL.tar.xz  
	mv -fv $WORKDIR/lib32$SYSTEM-$VERSION-$KERNEL.tar.xz $BACKUPDIR &
	tars /lib64   $WORKDIR/lib64$SYSTEM-$VERSION-$KERNEL.tar.xz  
	mv -fv $WORKDIR/lib64$SYSTEM-$VERSION-$KERNEL.tar.xz $BACKUPDIR &
	tars /boot   $WORKDIR/boot$SYSTEM-$VERSION-$KERNEL.tar.xz  
	mv -fv $WORKDIR/boot$SYSTEM-$VERSION-$KERNEL.tar.xz $BACKUPDIR &
	tars /var  $WORKDIR/var$SYSTEM-$VERSION-$KERNEL.tar.xz  
	mv -fv $WORKDIR/var$SYSTEM-$VERSION-$KERNEL.tar.xz $BACKUPDIR &
	tars /opt  $WORKDIR/opt$SYSTEM-$VERSION-$KERNEL.tar.xz  
	mv -fv $WORKDIR/opt$SYSTEM-$VERSION-$KERNEL.tar.xz $BACKUPDIR &
fi
echo "Archiwum stworzone!"


