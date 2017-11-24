sudo apt-get install -yf git-core g++ make cmake libtool pkg-config \
  libglib2.0-dev libqt4-dev libboost-test-dev libboost-thread-dev\
  libboost-filesystem-dev libboost-system-dev libqt5svg5-dev libqt5xmlpatterns5-dev qtbase5-dev
git clone git://sigrok.org/pulseview
mkdir -p /opt/sigrok/
if [ $? -eq 0 ]; then
    cd pulseview
    git checkout pulseview-0.4.0
    LD_LIBRARY_PATH=/opt/sigrok/lib/ PKG_CONFIG_PATH=/opt/sigrok/lib/pkgconfig/ cmake . -DCMAKE_INSTALL_PREFIX:PATH=/opt/sigrok/
    make -j5
    sudo make install
fi
