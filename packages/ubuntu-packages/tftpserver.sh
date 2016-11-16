# Serwer tFTP
sudo apt-get install xinetd tftpd tftp

#Tworzymy naszą usługę.
echo "service tftp 
{ 
protocol        = udp 
port            = 69 
socket_type     = dgram 
wait            = yes 
user            = nobody 
server          = /usr/sbin/in.tftpd 
server_args     = /tftpboot 
disable         = no 
}" > tftp 
sudo mv tftp /etc/xinetd.d/tftp

#Tworzymy katalog ftpboot
sudo mkdir /tftpboot
sudo chmod -R 777 /tftpboot
sudo chown -R nobody /tftpboot

#Restart usługi
sudo service xinetd restart
