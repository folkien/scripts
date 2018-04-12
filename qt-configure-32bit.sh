#sudo apt-get install libx32gcc-4.8-dev
#sudo apt-get install libc6-dev-i386
#sudo apt-get install lib32z1
#sudo apt-get install lib32ncurses5
#sudo apt-get install lib32bz2-1.0
#sudo apt-get install g++-multilib
mkdir -p /opt/Qt5.9.4-i386
 ./configure --prefix=/opt/Qt5.9.4-i386  --platform=linux-g++-32 -opensource -confirm-license -recheck -ssl
