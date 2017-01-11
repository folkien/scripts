sudo apt-get install git-core gcc make autoconf automake libtool
git clone git://sigrok.org/libserialport
mkdir -p /opt/sigrok/
if [ $? -eq 0 ]; then
    cd libserialport
    ./autogen.sh
    LD_LIBRARY_PATH=/opt/sigrok/lib/ PKG_CONFIG_PATH=/opt/sigrok/lib/pkgconfig/   ./configure --prefix=/opt/sigrok/
    make
    sudo make install
fi
