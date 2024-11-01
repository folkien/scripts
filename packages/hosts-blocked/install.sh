# Use previous version
if [ -e used.txt ]; then
    while true; do
        read -p "Use used txt? y/n" yn
        case $yn in
            [Yy]* ) 
                    sudo cp ./hosts.original /etc/hosts; sudo cat used.txt >> /etc/hosts
                    exit
                ;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

# Create new version
[ ! -e hosts.original ] && cp -v /etc/hosts ./hosts.original
# Clean used.txt
echo "" > used.txt

for host in $(cat ./all.csv)
do
    read -p "Block ${host}? y/n : " yn
    case $yn in
        [Yy]* )
                echo "0.0.0.0 ${host}.pl" >> used.txt
                echo "0.0.0.0 www.${host}.pl" >> used.txt
                echo "::0 ${host}.pl" >> used.txt
                echo "::0 www.${host}.pl" >> used.txt
                echo "0.0.0.0 ${host}.com" >> used.txt
                echo "0.0.0.0 www.${host}.com" >> used.txt
                echo "::0 ${host}.com" >> used.txt
                echo "::0 www.${host}.com" >> used.txt
                echo "0.0.0.0 ${host}.com.pl" >> used.txt
                echo "0.0.0.0 www.${host}.com.pl" >> used.txt
                echo "::0 ${host}.com.pl" >> used.txt
                echo "::0 www.${host}.com.pl" >> used.txt
            ;;
        [Nn]* ) ;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Update /etc/
sudo cp -rfv hosts.original /etc/hosts
sudo cat used.txt | sudo tee -a /etc/hosts
