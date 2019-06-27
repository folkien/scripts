#
sudo modprobe usbmon
sudo setfacl -m u:$USER:r /dev/usbmon*
wireshark &
