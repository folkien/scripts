[ -e plotFile.gplot ] && echo "Plot file overwritten!"

# Header
cat > plotFile.gplot << EOF
set datafile separator " "
set grid
EOF

plottedFirstLine=0

for var in "$@"
do
    echo "File $var"
    if [ ${plottedFirstLine} -eq 0 ]; then
        echo "plot '${var}' with lines title \"${var}\"" >> plotFile.gplot
        plottedFirstLine=1
    else
        echo "replot '${var}' with lines title \"${var}\"" >> plotFile.gplot
    fi
done

cat >> plotFile.gplot << EOF
replot
pause -1
EOF


gnuplot plotFile.gplot
