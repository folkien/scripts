arm-make LOADADDR=0x18000000 zImage -j9 && \
arm-make -j9 dtbs && \
arm-make -j9 modules && \
arm-make -j9 modules_install && \
arm-make -j9 tarbz2-pkg
