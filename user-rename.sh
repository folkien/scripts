new=${1}
old=${2}

sudo usermod -l ${new} ${old}
sudo groupmod -n ${new} ${old}
sudo usermod -d /home/${new} -m ${new}
