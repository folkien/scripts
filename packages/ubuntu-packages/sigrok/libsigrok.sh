sudo apt-get install git-core gcc g++ make autoconf autoconf-archive \
  automake libtool pkg-config libglib2.0-dev libglibmm-2.4-dev libzip-dev \
  libusb-1.0-0-dev libftdi-dev check doxygen python-numpy\
  python-dev python-gi-dev python-setuptools swig default-jdk
git clone git://sigrok.org/libsigrok
mkdir -p /opt/sigrok/
if [ $? -eq 0 ]; then
    cd libsigrok
    ./autogen.sh
    LD_LIBRARY_PATH=/opt/sigrok/lib/ PKG_CONFIG_PATH=/opt/sigrok/lib/pkgconfig/   ./configure --prefix=/opt/sigrok/
    make
    sudo PYTHONPATH=/opt/sigrok/lib/python2.7/site-packages/ make install
fi
