#Find and trace last trace
unset -v latest
for dir in `find . -type d`
do
    file=${dir}/trace.txt
    [ -e ${file} ] && [[ $file -nt $latest ]] && latest=$file
done

[ -e ${latest} ] && echo "Latest trace : $latest." && cp -rfv ${latest} ${latest}.bak

