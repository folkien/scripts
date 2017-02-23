# Converitng png file to linux logo 
file=$1
name="${file%.*}"
pngtopnm ${file} | ppmquant -fs 224 | pnmtoplainpnm > ${name}_clut224.ppm
