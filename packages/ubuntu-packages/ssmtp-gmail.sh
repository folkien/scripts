sudo apt-get install ssmtp
sudo apt-get install mutt
sudo mv /etc/ssmtp/ssmtp.conf /etc/ssmtp/ssmtp.conf.bak
cat >> ssmtp.conf << EOF 
root=<gmail-user>@gmail.com
mailhub=smtp.gmail.com:587

FromLineOverride=YES
AuthUser=<gmail-user>@gmail.com
AuthPass=<gmail-password>
UseSTARTTLS=YES
UseTLS=YES
EOF

kate ssmtp.conf
sudo mv ssmtp.conf /etc/ssmtp/ssmtp.conf
echo "Config updated."

# Secure
sudo groupadd ssmtp
sudo usermod -a -G ssmtp $USER
sudo chown :ssmtp /usr/sbin/ssmtp
sudo chmod g+s /usr/sbin/ssmtp
sudo chmod 640 /etc/ssmtp/ssmtp.conf
echo "Config secured. Reboot needed !!!"
