sudo apt remove -yf sendmail
sudo apt install -yf libsasl2-2 ca-certificates libsasl2-modules
sudo apt install -yf mailutils
sudo apt install -yf postfix

sudo mkfifo /var/spool/postfix/public/pickup
sudo sed -i "s/inet_interfaces.*/inet_interfaces \= loopback-only/g" /etc/postfix/main.cf
sudo tee -a << EOF /etc/postfix/main.cf > /dev/null
relayhost = [smtp.gmail.com]:587
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd
smtp_sasl_security_options = noanonymous
smtp_tls_CAfile = /etc/postfix/cacert.pem
smtp_use_tls = yes
EOF

echo "[smtp.gmail.com]:587    USERNAME@gmail.com:PASSWORD" > sasl_passwd
kate sasl_passwd
waitpid
sudo mv sasl_passwd  /etc/postfix/sasl_passwd
sudo chmod 400 /etc/postfix/sasl_passwd
sudo postmap /etc/postfix/sasl_passwd
cat /etc/ssl/certs/Thawte_Premium_Server_CA.pem | sudo tee -a /etc/postfix/cacert.pem


sudo systemctl stop sendmail
sudo systemctl disable sendmail
sudo systemctl restart postfix
