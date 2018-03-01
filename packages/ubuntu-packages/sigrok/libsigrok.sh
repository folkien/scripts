sudo apt-get install -yf git-core gcc g++ make autoconf autoconf-archive libglibmm-2.4 \
  automake libtool pkg-config libglib2.0-dev libglibmm-2.4-dev libzip-dev libzip4-dev \
  libusb-1.0-0-dev libftdi-dev check doxygen python-numpy  libzip-dev \
  python-dev python-gi-dev python-setuptools swig default-jdk libusb-1.0-0-dev \
  libftdi-dev
git clone git://sigrok.org/libsigrok
mkdir -p /opt/sigrok/
if [ $? -eq 0 ]; then
    cd libsigrok
    git checkout libsigrok-0.5.0
    ./autogen.sh
    LD_LIBRARY_PATH=/opt/sigrok/lib/ PKG_CONFIG_PATH=/opt/sigrok/lib/pkgconfig/   ./configure --prefix=/opt/sigrok/ --enable-cxx --enable-all-drivers 
    make -j5
    sudo PYTHONPATH=/opt/sigrok/lib/python2.7/site-packages/ make install
fi
