#install if not exists or given arg
if [ ! -e /opt/samsung ] || [ "$1" == "all" ]; then
    wget http://downloadcenter.samsung.com/content/DR/201407/20140709152519621/ULD_V1.00.27.04.tar.gz
    tar -xvf ULD_V1.00.27.04.tar.gz
    cd uld
    sudo sh install.sh
fi
echo "Changing permissions."
sudo usermod -a -G lp $USER
sudo usermod -a -G lpadmin $USER
sudo chown root.root -R /opt/smfp-common/
sudo chown root.root -R /opt/samsung/


