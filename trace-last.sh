#Find and trace last trace
source /etc/messages.sh
unset -v latest
for dir in `find . -type d`
do
    file=${dir}/trace.txt
    [ -e ${file} ] && [[ $file -nt $latest ]] && latest=$file
done
cat ${latest}
minfo "Latest trace : $latest."

