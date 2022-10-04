sudo apt install libpcap-dev
git clone git@github.com:Emanem/nettop.git
cd nettop/
make release -j9
sudo cp nettop /usr/bin/
