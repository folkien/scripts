sudo apt-get install git-core gcc make autoconf automake libtool pkg-config libglib2.0-dev
mkdir -p /opt/sigrok/
git clone git://sigrok.org/sigrok-cli
if [ $? -eq 0 ]; then
     cd sigrok-cli
    ./autogen.sh
    LD_LIBRARY_PATH=/opt/sigrok/lib/ PKG_CONFIG_PATH=/opt/sigrok/lib/pkgconfig/   ./configure --prefix=/opt/sigrok/
    make
    sudo PYTHONPATH=/opt/sigrok/lib/python2.7/site-packages/ make install
fi