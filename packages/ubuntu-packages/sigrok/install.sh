sudo mkdir -p /opt/sigrok
sudo chown $USER.$USER -R /opt/sigrok
./libserialport.sh
./libsigrok.sh
./libsigrokdecode.sh
./sigrok-cli.sh
./sigrok-firmware.sh
./sigrok-firmware-fx2lafw.sh
./sigrok-util.sh
./pulseview.sh
sudo chown $USER.$USER -R /opt/sigrok
sudo cp -rfv 98-sigrok.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
