# Script with installation of all systemd scripts.
sudo cp -rfv ./systemctl/*.sh /usr/bin/
sudo cp -rfv ./systemctl/*.service /etc/systemd/system/

# Enable all timers
for file in ./systemctl/*.timer; do
    name=$(basename ${file})
    sudo cp -rfv ${file} /etc/systemd/system/
    # If service exists then only copy
    if [ -e /etc/systemd/system/${name} ]; then
        echo "Exists. Updated ${name}!"
    #If not exists then start also
    else
        sudo systemctl enable $name
        sudo systemctl start $name
        sudo systemctl status $name
    fi
done

