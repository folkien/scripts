sudo mkdir -p /opt/sigrok
sudo chown $USER.$USER -R /opt/sigrok
./libserialport.sh
./libsigrok.sh
./libsigrokdecode.sh
./sigrok-cli.sh
./pulseview.sh
sudo cp -rfv 98-sigrok.rules /etc/udev/rules.d/
