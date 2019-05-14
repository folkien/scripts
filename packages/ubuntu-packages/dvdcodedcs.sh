#if Force
if [ "$1" == "-f" ]; then
    sudo snap remove vlc
    sudo apt purge -yf vlc vlc-bin vlc-plugin-access-extra browser-plugin-vlc
    sudo apt purge -yf libdvdnav4 libdvdread4 libdvd-pkg libdvdcss2 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
    sudo apt purge -yf ubuntu-restricted-extras
fi
sudo apt install -yf libdvdnav4 libdvdread4 libdvd-pkg libdvdcss2 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
sudo dpkg-reconfigure -u libdvd-pkg
sudo apt install -yf ubuntu-restricted-extras regionset
echo "!!! Use region 2 for Europe !!!"
sudo regionset
# Ubuntu version is not working, using snap instead.
#sudo apt install -yf vlc vlc-plugin-access-extra browser-plugin-vlc
sudo snap install vlc
# Check command
# sudo apt install -yf libdvdnav4 libdvdread4 libdvd-pkg libdvdcss2 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly ubuntu-restricted-extras
