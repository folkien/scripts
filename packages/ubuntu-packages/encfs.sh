# instalacja encfs
sudo apt-get install encfs -yf
sudo apt-get install cryptkeeper -yf
sudo addgroup spasz fuse
sudo apt-get install libpam-encfs
sudo apt-get install libpam-mount -yf
sudo add-apt-repository ppa:gencfsm && sudo apt-get update && sudo apt-get -y install gnome-encfs-manager
