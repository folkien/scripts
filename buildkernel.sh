source /etc/messages.sh
if [ -f .loadaddr  ]; then
    M_LOADADDR=$(cat .loadaddr)
else
    echo "Give me loadaddr, e.g. 0x18000000 :"
    read M_LOADADDR
    echo $M_LOADADDR > .loadaddr
fi

if [ -f .imagetype ]; then
    M_IMAGETYPE=$(cat .imagetype)
else
    echo "Give me imagetype e.g. zImage, uImage :"
    read M_IMAGETYPE
    echo $M_IMAGETYPE > .imagetype
fi

arm-make LOADADDR=${M_LOADADDR} ${M_IMAGETYPE} -j9 && \
arm-make -j9 dtbs && \
arm-make -j9 modules && \
arm-make -j9 modules_install && \
arm-make -j9 tarbz2-pkg
if [ $? -eq 0 ]; then
    msuccess "Compilation completed!"
    minfo "Image size:"
    ls -lah ./arch/arm/boot/${M_IMAGETYPE}
else
    merror "Compilation failed!"
fi
