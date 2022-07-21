#!/bin/bash
#
# Jeżeli zdjecie ma szerokosc wieksza od 800px to zostanie
# przeskalowane. Mniejszych zdjec nie rusza.
#
# Sławomir Paszko
# Argument $1 to zdjecia do konwersji.
# Argument $2 jezeli jest podany, to max-szerokość zdjęcia.

#
#
# Przykład użycia
# ./resize.sh /images/ 800
FILES=$1

# Szerokość nowego zdjęcia.
if [ "$#" -gt 1 ] ; then
		WIDTH=$2
else
		WIDTH=800
fi

function convertPhoto {
		FILE=$1
		WIDTH=$2
		echo $FILE
		EXTENSION=`echo $FILE | grep "\.[a-zA-Z0-9]*$" -o`
		case "$EXTENSION" in
		.png | .PNG | .JPG | .jpg | .jpeg | .JPEG | .GIF | .gif | .tiff | .TIFF )
		  echo "convert -resize $WIDTH\> $FILE $FILE"
		  convert -resize $WIDTH\> "$FILE" "$FILE"
		  ;;
		* ) echo " Nie znam tego rozszerzenia $f."
		   ;;
		esac
}
export -f convertPhoto

#Petla główna
find $FILES -mindepth 1 -maxdepth 2 -type f -print0 | xargs -0 -i bash -c 'convertPhoto "$@"' _ {} $WIDTH

#FILELIST=$(find $FILES)
#N=$(find $FILES | wc -l)
#I=0
#for f in $FILELIST
#do
  #EXTENSION=`echo $f | grep "\.[a-zA-Z0-9]*$" -o`
  #case "$EXTENSION" in
        #.png | .PNG | .JPG | .jpg | .GIF | .gif | .tiff | .TIFF )
		  #let PERC=($I*100)/N
		  #echo "($PERC %)Konwersja $f ..."
		  #echo "convert -resize $WIDTH $f $f"
		  #convert -resize $WIDTH\> $f $f
		  #;;
        #* ) echo " Nie znam tego rozszerzenia $f."
           #;;
  #esac

  #let I+=1
#done
