prefix="${1}"
drive=$(usb-select-drive)

if [ -e ${drive} ]; then
    dd if=${drive} of=${prefix}_512B.bin bs=512 count=1
    dd if=${drive} of=${prefix}_4KB.bin bs=4096 count=1
    dd if=${drive} of=${prefix}_1MB.bin bs=1MB count=1
fi

