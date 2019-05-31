# Use previous version
if [-e used.txt]; then
    while true; do
        read -p "Use used txt? y/n" yn
        case $yn in
            [Yy]* ) sudo cp ./hosts.original /etc/hosts; sudo cat used.txt >> /etc/hosts; exit;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

# Create new version
[ ! -e hosts.original ] && cp -v /etc/hosts ./hosts.original

for host in $(cat ./all.csv)
do
    echo ${host}
done
