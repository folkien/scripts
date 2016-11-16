#SSH server konfiguracja ubuntu 14.04
echo "Instalacja server'a ssh."
sudo apt-get -yf install openssh-server 
sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.factory-defaults
sudo chmod a-w /etc/ssh/sshd_config.factory-defaults
sudo ufw limit ssh

#kopiowanie aktualnej konfiguracji
sudo cp -rfv ./ssh-server-items/issue /etc/
sudo cp -rfv ./ssh-server-items/sshd_config /etc/ssh/

#Restart servera po konfiguracji
sudo restart ssh

