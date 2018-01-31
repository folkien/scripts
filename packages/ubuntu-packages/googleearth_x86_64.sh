cd /tmp
mkdir google-earth && cd google-earth
wget http://archive.ubuntu.com/ubuntu/pool/main/l/lsb/lsb-invalid-mta_4.1+Debian11ubuntu8_all.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/l/lsb/lsb-security_4.1+Debian11ubuntu8_amd64.deb
wget http://archive.ubuntu.com/ubuntu/pool/main/l/lsb/lsb-core_4.1+Debian11ubuntu8_amd64.deb
sudo dpkg -i *.deb
sudo apt -f install
wget https://dl.google.com/dl/earth/client/current/google-earth-stable_current_amd64.deb
sudo dpkg -i google-earth-stable*.deb
