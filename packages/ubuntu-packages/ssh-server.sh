#!/bin/bash
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"


sshd > /dev/null
if [ $? -ne 255 ]; then
    echo "Instalacja server'a ssh."
    sudo apt-get -yf install openssh-server 
fi

echo "Konfiguracja server'a ssh."
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
sudo chmod a-w /etc/ssh/sshd_config.factory-defaults
sudo ufw limit ssh

#kopiowanie aktualnej konfiguracji
sudo cp -rfv ${DIR}/ssh-server-items/issue /etc/
sudo cp -rfv ${DIR}/ssh-server-items/sshd_config /etc/ssh/

#Restart servera po konfiguracji
sudo systemctl restart sshd
sudo systemctl status sshd


