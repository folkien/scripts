#!/bin/bash
# Montowanie i wejście do skryptu
# Należy uruchamiać z sudo lub uprawnieniami root'a.
#
# Argumenty :
# $1 - argument czy "m"ontować czy nie "u"
# $2 - nazwa obrazu,
IMGFILE=$2
IMGNAME=`echo $IMGFILE | grep "[a-zA-Z0-9\.\_\-]*$" - `
MNTDIR=/mnt/$IMGNAME.dir

if [ $1 = "m" ] ; then
		echo "Montowanie systemu."
		mkdir $MNTDIR
		mount $IMGFILE $MNTDIR
		mount --bind /proc $MNTDIR/proc
		mount --bind /sys $MNTDIR/sys
		mount --bind /dev $MNTDIR/dev

		echo "Wchodzę do wnetrzna systemu.."
		chroot $MNTDIR
elif [ $1 = "u" ] ; then
		echo "Odmontowuje system."
		umount $MNTDIR/proc
		umount $MNTDIR/sys
		umount $MNTDIR/dev
		umount $MNTDIR
		rm -rf $MNTDIR
fi

