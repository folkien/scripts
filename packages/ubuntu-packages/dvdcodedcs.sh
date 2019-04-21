sudo apt purge -yf vlc vlc-plugin-access-extra browser-plugin-vlc
sudo apt purge -yf libdvdnav4 libdvdread4 libdvd-pkg libdvdcss2 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
sudo apt purge -yf ubuntu-restricted-extras
sudo apt install -yf libdvdnav4 libdvdread4 libdvd-pkg libdvdcss2 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly
sudo dpkg-reconfigure -u libdvd-pkg
sudo apt install -yf ubuntu-restricted-extras regionset
sudo apt install -yf vlc vlc-plugin-access-extra browser-plugin-vlc
echo "!!! Use region 2 for Europe !!!"
sudo regionset
# Check command
sudo apt install -yf libdvdnav4 libdvdread4 libdvd-pkg libdvdcss2 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly vlc ubuntu-restricted-extras
