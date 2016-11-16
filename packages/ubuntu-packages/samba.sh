#Script to install samba
sudo apt-get -yf install samba samba-common python-glade2 system-config-samba winbind
sudo mv /etc/samba/smb.cnf /etc/samba/smb.cnf.bak
mkdir -p /samba/anonymous

