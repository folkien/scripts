sudo -H pip install pyocd
sudo cp -rfv pyocd-udev/*.rules /etc/udev/rules.d
sudo udevadm control --reload-rules && sudo udevadm trigger
pyocd-tool list
