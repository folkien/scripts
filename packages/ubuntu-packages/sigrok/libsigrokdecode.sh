sudo apt-get install -yf git-core gcc make autoconf automake libtool pkg-config libglib2.0-dev python3-dev
git clone git://sigrok.org/libsigrokdecode
mkdir -p /opt/sigrok/
if [ $? -eq 0 ]; then
    cd libsigrokdecode
    git checkout libsigrokdecode-0.5.0
    ./autogen.sh
    LD_LIBRARY_PATH=/opt/sigrok/lib/ PKG_CONFIG_PATH=/opt/sigrok/lib/pkgconfig/   ./configure --prefix=/opt/sigrok/
    make
    sudo PYTHONPATH=/opt/sigrok/lib/python2.7/site-packages/ make install
fi
