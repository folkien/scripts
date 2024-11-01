ServicesDir=$(pwd)/systemctl

# Script with installation of all systemd scripts.
sudo ln -sfv ${ServicesDir}/*.sh /usr/bin/
sudo ln -sfv ${ServicesDir}/*.service /etc/systemd/system/
sudo ln -sfv ${ServicesDir}/DefaultEnable/*.service /etc/systemd/system/

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
        sudo systemctl enable $name
        # if not started
        sudo systemctl list-timers | grep ${name}
        if [ $? -ne 0 ]; then
            echo "Exists. Started also ${name}!"
            sudo systemctl start $name
        fi
    #If not exists then start also
    else
        sudo systemctl enable $name
        sudo systemctl start $name
    fi
    sudo systemctl status $name
done

# Enable all default services
for file in ${ServicesDir}/DefaultEnable/*.service; do
    name=$(basename ${file})
    sudo systemctl enable $name
    sudo systemctl status $name
done

sudo systemctl daemon-reload
