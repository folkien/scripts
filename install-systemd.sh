# Script with installation of all systemd scripts.
sudo cp -rfv ./systemctl/*.sh /usr/bin/
sudo cp -rfv ./systemctl/*.service /etc/systemd/system/
sudo cp -rfv ./systemctl/*.timer /etc/systemd/system/
