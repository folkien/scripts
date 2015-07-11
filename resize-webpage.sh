#!/bin/bash
# Sławomir Paszko 
# Argument $1 to zdjecia do konwersji.
# Argument $2 jezeli jest podany, to max-szerokość zdjęcia.
# Argument $3 jezeli jest podano jako 'r' to usuwa zdjęcie.
#
# Przykład użycia
# ./resize.sh /images/ 800
FILES=$1

# Szerokość nowego zdjęcia.
if [ "$#" -gt 1 ] ; then
		WIDTH=$2
else
		WIDTH=500
fi


#Petla główna
N=`ls -l $FILES | wc -l`
I=0

FILELIST=$(find $FILES)
for f in $FILELIST
do
  EXTENSION=`echo $f | grep "\.[a-zA-Z0-9]*$" -o`
  case "$EXTENSION" in
        .png | .PNG | .JPG | .jpg | .GIF | .gif | .tiff | .TIFF ) 
		  let PERC=($I*100)/N
		  echo "($PERC %)Konwersja $f ..."
		  echo "convert -resize $WIDTH $f $f"
		  convert -resize $WIDTH\> $f $f
		  ;;
        * ) echo " Nie znam tego rozszerzenia $f."
           ;;
  esac

  let I+=1
done
