# Author :Sławomir Paszko <folkus@gmail.com>
# 
echo "Instalacja flashplayera.."
mkdir /tmp/install
cd /tmp/
axel https://fpdownload.macromedia.com/get/flashplayer/pdc/11.2.202.451/install_flash_player_11_linux.x86_64.tar.gz
#axel http://fpdownload.macromedia.com/get/flashplayer/pdc/11.2.202.425/install_flash_player_11_linux.i386.tar.gz
tar -xvf install_flash_player_11_linux.x86_64.tar.gz -C /tmp/install/
sudo cp -rfv /tmp/install/usr /
sudo cp -rfv /tmp/install/libflashplayer.so /usr/lib/mozilla/plugins
rm -rf /tmp/install
echo "...OK!"

