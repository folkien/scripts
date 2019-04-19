#Find and trace last trace
unset -v latest
for dir in `find . -type d`
do
    file=${dir}/trace.txt
    [ -e ${file} ] && [[ $file -nt $latest ]] && latest=$file
done
echo "Latest trace : $latest."
cat ${latest}

