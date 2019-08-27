
mkdir -p /opt/caprine/
cp -rfv Caprine*.AppImage /opt/caprine/
chmod a+x /opt/caprine/*.AppImage
sudo ln -sf /opt/caprine/Caprine*AppImage /usr/bin/caprine

