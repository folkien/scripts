# Script with installation of all systemd scripts.
sudo cp -rfv ./systemctl/*.sh /usr/bin/
sudo cp -rfv ./systemctl/*.service /etc/systemd/system/
sudo cp -rfv ./systemctl/*.timer /etc/systemd/system/
# Enable all timers
for file in ./systemctl/*.timer; do
    name=$(basename ${file})
    sudo systemctl start $name
    sudo systemctl status $name
done
