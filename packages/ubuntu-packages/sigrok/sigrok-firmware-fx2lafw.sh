sudo apt-get install sdcc -yf
git clone git://sigrok.org/sigrok-firmware-fx2lafw
mkdir -p /opt/sigrok/
if [ $? -eq 0 ]; then
    cd sigrok-firmware-fx2lafw
    git checkout sigrok-firmware-fx2lafw-0.1.5
    ./autogen.sh
    LD_LIBRARY_PATH=/opt/sigrok/lib/ PKG_CONFIG_PATH=/opt/sigrok/lib/pkgconfig/   ./configure --prefix=/opt/sigrok/
    make -j5
    sudo make install
fi
