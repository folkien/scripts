sudo apt install -yf mailutils
sudo apt install -yf postfix
sudo apt remove -yf sendmail
sudo mkfifo /var/spool/postfix/public/pickup
sudo sed -i "s/inet_interfaces.*/inet_interfaces \= loopback-only/g" /etc/postfix/main.cf
sudo systemctl stop sendmail
sudo systemctl disable sendmail
sudo systemctl restart postfix
