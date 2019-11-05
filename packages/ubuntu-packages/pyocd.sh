sudo -H pip install pyocd
sudo cat <<EOF > /etc/udev/rules.d/50-mbed.rules
# 0d28:0204 NXP FRDM-K64F
SUBSYSTEM=="usb", ATTR{idVendor}=="0d28", ATTR{idProduct}=="0204", MODE:="666"
EOF
sudo udevadm control --reload-rules && sudo udevadm trigger
pyocd-tool list
