sudo apt-get install xrdp
sudo ufw allow 3389/tcp
sudo adduser xrdp ssl-cert
sudo iptables -A INPUT -p tcp --dport 3389 -j ACCEPT
sudo netfilter-persistent save
sudo netfilter-persistent reload
