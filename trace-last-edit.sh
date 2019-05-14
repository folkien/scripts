#Find editor
kate --version
if [ $? -eq 0 ]; then
    editor="kate"
else
    gvim --version
    if [ $? -eq 0 ]; then
        editor="gvim"
    else
        editor="gedit"
    fi
fi

#Find and trace last trace
unset -v latest
for dir in `find . -type d`
do
    file=${dir}/trace.txt
    [ -e ${file} ] && [[ $file -nt $latest ]] && latest=$file
done

[ -e ${latest} ] && echo "Latest trace : $latest." && ${editor} ${latest}

