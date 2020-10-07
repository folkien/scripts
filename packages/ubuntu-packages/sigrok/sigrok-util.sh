git clone git://sigrok.org/sigrok-util
cd sigrok-util/firmware
sudo ln -sf $(pwd)/firmware/dreamsourcelab-dslogic/sigrok-fwextract-dreamsourcelab-dslogic /usr/bin/
sudo ln -sf $(pwd)/firmware/saleae-logic16/sigrok-fwextract-saleae-logic16 /usr/bin/
sudo ln -sf $(pwd)/firmware/hantek-dso/sigrok-fwextract-hantek-dso /usr/bin/
