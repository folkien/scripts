sudo apt install tlp -yf
sudo apt install tlp-rdw -yf
sudo apt-get install tp-smapi-dkms acpi-call-dkms -yf
sudo systemctl enable tlp.service
sudo systemctl enable tlp-sleep.service
sudo tlp usb
sudo tlp bayoff

