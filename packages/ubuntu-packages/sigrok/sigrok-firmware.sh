git clone git://sigrok.org/sigrok-firmware
mkdir -p /opt/sigrok/
if [ $? -eq 0 ]; then
    cd sigrok-firmware
    ./autogen.sh
    LD_LIBRARY_PATH=/opt/sigrok/lib/ PKG_CONFIG_PATH=/opt/sigrok/lib/pkgconfig/   ./configure --prefix=/opt/sigrok/
    make -j5
    make install
fi
