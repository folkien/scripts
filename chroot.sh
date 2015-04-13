#!/bin/bash
# Montowanie i wejście do skryptu
MNTDIR=/mnt/gentoo
#IMGFILE=mmr-imx.ext4
IMGFILE=$2

if [ $1 = "m" ] ; then
		echo "Montowanie systemu."
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
fi


