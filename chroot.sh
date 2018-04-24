#!/bin/bash
# Autor : Sławomir Paszko <folkus@gmail.com>
# Montowanie i wejście do skryptu
# Należy uruchamiać z sudo lub uprawnieniami root'a.
#
# Argumenty :
# $1 - argument czy "m"ontować czy nie "u"
# $2 - nazwa obrazu,
IMGFILE=$2

#Sprawdzamy czy IMGFILE to plik czy katalog ?
if [ -d $IMGFILE ] ; then
		MNTDIR=$IMGFILE
else
		IMGNAME=`echo $IMGFILE | grep "[a-zA-Z0-9\.\_\-]*$" - `
		MNTDIR=/mnt/$IMGNAME.dir
fi




# Sprawdzanie czy jestem rootem
if [ "$EUID" -ne 0 ] ; then 
  echo "Proszę, uruchom ten skypt jako root i najlepiej 'sudo su' ze wzgledu na to ze samo sudo powoduje duzo dziwnych problemow."
  exit 1
fi


# Sprawdzanie ilości argumentów
if [ "$#" -lt 2 ] ; then
		echo "Podałeś za mało argumentów skryptu."
		echo "Przykładowe użycie : "
		echo " ./chroot-img.sh [m/u] [nazwaobrazu] "
fi

if [ $1 = "m" ] ; then
		# Czy katalog istnieje
		if [ -d $MNTDIR ] ; then
				echo "Katalog istnieje."
		else
				mkdir $MNTDIR -v
		fi
		# Czy katalog nie jest pusty ?
		if [ "$(ls -A $MNTDIR)" ]; then
				echo "System jest juz zamontowany."
		else
				mount $IMGFILE -t ext4 $MNTDIR -v
				pyNotify -s "Mount : Zamontowano $IMGFILE w $MNTDIR."
		fi

		# bindowanie katalogów kernela
		echo "Binduje katalogi."
		mount --bind /proc $MNTDIR/proc
		mount --bind /sys $MNTDIR/sys
		mount --bind /dev $MNTDIR/dev
		mount --bind /run $MNTDIR/run
		mount --bind /tmp $MNTDIR/tmp

		echo "Wchodzę do wnetrzna systemu.."
		pyNotify -s "Chroot : Użytkownik $USER zalogował się w $MNTDIR."
		chroot $MNTDIR
		pyNotify -s "Chroot : Użytkownik $USER opuścił $MNTDIR."
elif [ $1 = "u" ] ; then
		echo "Odmontowuje system."
		# Odbindowanie katalogów kernela
		umount $MNTDIR/proc
		umount $MNTDIR/sys
		umount $MNTDIR/dev
		umount $MNTDIR/run
		umount $MNTDIR/tmp
		#Demontaż oraz usuwanie obrazu
		umount $MNTDIR
		pyNotify -s "Mount : Odmontowano $MNTDIR oraz proc,sys,dev."
fi


