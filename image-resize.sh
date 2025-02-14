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
FILES="$1"

# Szerokość nowego zdjęcia.
if [ "$#" -gt 1 ] ; then
		WIDTH="$2"
else
		WIDTH=800
fi

function convertPhoto {
        # Resize file and convert to jpeg.
		FILE="$1"
		WIDTH="$2"
        filepath_noext="${FILE%.*}"
        filename=$(basename $FILE)
        filename_noext="${filename%.*}"
		extension=`echo $FILE | grep "\.[a-zA-Z0-9]*$" -o`
        # Input filepath and output filepath
        inFilepath="${FILE}"
        outFilePath="${filepath_noext}.jpg"

		case "$extension" in
		.png | .PNG | .JPG | .jpg | .jpeg | .JPEG | .GIF | .gif | .tiff | .TIFF )
		  echo "convert -resize $WIDTH $FILE ${filepath_noext}.jpg"
		  convert -resize $WIDTH "${inFilepath}" "${outFilePath}"
          # Delete original if :
          # - extension was diffrent and,
          # - output file exists,
          if [ "${inFilepath}" != "${outFilePath}" ] && [ -e ${outFilePath}  ]; then
              rm -rfv ${FILE}
          fi
		  ;;
		* )
            echo " Nie obsługuje pliku ${filename}."
		   ;;
		esac
}
export -f convertPhoto

#Petla główna
find "$FILES" -mindepth 1 -maxdepth 2 -type f -print0 | xargs -0 -i bash -c 'convertPhoto "$@"' _ {} $WIDTH
