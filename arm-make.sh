make INSTALL_MOD_PATH=/tmp/ \
     INSTALL_FW_PATH=/tmp/ \
     INSTALL_HDR_PATH=/tmp/ \
     INSTALL_PATH=/tmp/ \
     ARCH=arm \
     LOADADDR=0x18000000 \
     CROSS_COMPILE=/usr/bin/arm-linux-gnueabihf- \
     CC=/usr/bin/arm-linux-gnueabihf-gcc \
     CXX=/usr/bin/arm-linux-gnueabihf-g++ \
     $@

