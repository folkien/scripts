ServicesDir=$(pwd)/systemctl

# Script with installation of all systemd scripts.
sudo ln -sfv ${ServicesDir}/*.sh /usr/bin/
sudo ln -sfv ${ServicesDir}/*.service /etc/systemd/system/

# Create and update environment file
env > scripts.env
sudo mv -fv scripts.env /etc/

# Enable all timers
for file in ./systemctl/*.timer; do
    name=$(basename ${file})
    sudo ln -sfv ${ServicesDir}/${name} /etc/systemd/system/
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

sudo systemctl daemon-reload
