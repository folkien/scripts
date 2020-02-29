nc -z 8.8.8.8 53 -w 2 >/dev/null 2>&1
online=$?
echo ${online}
exit ${online}
