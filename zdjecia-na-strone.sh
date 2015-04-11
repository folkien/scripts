#!/bin/bash
# Sławomir Paszko 
# Argument $1 to zdjecia do konwersji.
# Argument $2 jezeli jest podany, to max-szerokość zdjęcia.
# Argument $3 jezeli jest podano jako 'r' to usuwa zdjęcie.
#
# Przykład użycia
# ./zdjecia-na-strone.sh "./*"
FILES=$1

# Szerokość nowego zdjęcia.
if [ "$#" -gt 1 ] ; then
		WIDTH=$2
else
		WIDTH=500
fi

#Czy usuwamy stary plik?
if [ "$#" -gt 2 ] ; then
		DESTROY=1
else
		DESTROY=0
fi

#Petla główna
N=`ls -l $FILES | wc -l`
I=0
for f in $FILES
do
  EXTENSION=`echo $f | grep "\.[a-zA-Z0-9]*$" -o`
  case "$EXTENSION" in
        .png | .PNG | .JPG | .jpg | .GIF | .gif | .tiff | .TIFF ) 
		  let PERC=($I*100)/N
		  echo "($PERC %)Konwersja $f ..."
		  convert -resize $WIDTH $f img-$I$EXTENSION
		  if [ "$DESTROY" -eq 1 ] ; then
				  rm -rfv $f
		  fi
		  ;;
        * ) echo " Nie znam tego rozszerzenia $f."
           ;;
  esac

  let I+=1
done
