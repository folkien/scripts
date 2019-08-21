[ $# -eq 0 ] && echo "Missing prefix" && exit -1

prefix="${1}"
drive=$(usb-select-drive)

if [ -e ${drive} ]; then
    driveName=$(basename ${drive})
    # partition info
    sudo fdisk -l ${drive} > ${prefix}_partinfo.txt
    sudo fdisk -l ${drive} | grep "${drive}[0-9]" | while read -r line; 
    do
        sectorSize=$(cat /sys/block/${driveName}/queue/hw_sector_size)
        dumpSize=$((1024*1024/${sectorSize}))
        partition=$(echo ${line} | grep "${drive}[0-9]" -o)
        startPartition=$(echo ${line} | cut -c 10- | grep -o -E '[0-9]+' | head -1)
        startPartByteAddress=$((${startPartition} * ${sectorSize}))
        echo "Found partition ${partition} starts ${startPartition} (${startPartByteAddress})."
        sudo dd if=${drive} of=${prefix}_partinfo.bin count=${dumpSize} skip=${startPartition}
        hexdump -C ${prefix}_partinfo.bin > ${prefix}_partinfo.bin.txt
    done
    # binary dumps
    sudo dd if=${drive} of=${prefix}_512B.bin bs=512 count=1
    sudo dd if=${drive} of=${prefix}_4KB.bin bs=4096 count=1
    # hexdumps
    hexdump -C ${prefix}_512B.bin > ${prefix}_512B.bin.txt
    hexdump -C ${prefix}_4KB.bin >  ${prefix}_4KB.bin.txt
    # First ten 1MB;s
    for i in {0..9}
    do
        filePattern="${prefix}_${i}_1MB.bin"
        sudo dd if=${drive} of=${filePattern} bs=1MB count=1 skip=${i}
        hexdump -C ${filePattern} > ${filePattern}.txt
    done
fi

