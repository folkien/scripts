# Handle GIF creation
convert -delay 20 -loop 0 $(ls *.png -t) output.gif
