#axel downloader
#wget https://alioth.debian.org/frs/download.php/3015/axel-2.4.tar.gz
/usr/bin/wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=0B9IKRrk3HdagMi1sQXhTZXZZUzQ' -O axel-2.4.tar.bz2
tar -xvf axel-2.4.tar.gz
cd ./axel-2.4
./configure
make
sudo make install
