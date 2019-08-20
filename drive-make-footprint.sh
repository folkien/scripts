[ $# -eq 0 ] && echo "Missing prefix" && exit -1

prefix="${1}"
drive=$(usb-select-drive)

if [ -e ${drive} ]; then
    # binary dumps
    sudo dd if=${drive} of=${prefix}_512B.bin bs=512 count=1
    sudo dd if=${drive} of=${prefix}_4KB.bin bs=4096 count=1
    sudo dd if=${drive} of=${prefix}_1MB.bin bs=1MB count=1
    sudo dd if=${drive} of=${prefix}_10MB.bin bs=10MB count=1
    # hexdumps
    hexdump -C ${prefix}_512B.bin > ${prefix}_512B.bin.txt
    hexdump -C ${prefix}_4KB.bin >  ${prefix}_4KB.bin.txt
    hexdump -C ${prefix}_1MB.bin >  ${prefix}_1MB.bin.txt
    hexdump -C ${prefix}_10MB.bin > ${prefix}_10MB.bin.txt
fi

