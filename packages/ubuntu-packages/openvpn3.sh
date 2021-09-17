DISTRO=$(lsb_release -c -s)
sudo apt install apt-transport-https
wget -qO -  https://swupdate.openvpn.net/repos/openvpn-repo-pkg-key.pub | sudo apt-key add -
sudo wget -O /etc/apt/sources.list.d/openvpn3.list https://swupdate.openvpn.net/community/openvpn3/repos/openvpn3-${DISTRO}.list
sudo apt update
sudo apt install openvpn3
