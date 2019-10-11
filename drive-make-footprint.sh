source /etc/messages.sh
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
        partitionNumber=$(echo ${partition} | grep "[0-9]" -o)
        partitionType=$( echo ${line} | grep -oE '[^ ]+$' )
        startPartition=$(echo ${line} | cut -c 10- | grep -o -E '[0-9]+' | head -1)
        startPartByteAddress=$((${startPartition} * ${sectorSize}))
        minfo "Found partition ${partition} starts ${startPartition} (${startPartByteAddress}) Type ${partitionType}."
        partitionFile="${prefix}_part${partitionNumber}.bin"
        fsinfoFile="${prefix}_part${partitionNumber}_fsinfo.txt"
        sudo dd if=${drive} of=${partitionFile} count=${dumpSize} skip=${startPartition}
        hexdump -C ${partitionFile}  > ${partitionFile}.txt
        # Filesystem info
        case "${partitionType}" in
            "FAT32") 
                # FATCAT info
                echo "FAT32 found"
                fatcat ${partitionFile} -i > ${fsinfoFile}
                if [ $? -ne 0 ]; then
                    echo "Missing fatcat program!"
                    exit 1
                fi
                FATSectorsSize=$(cat ${fsinfoFile} | grep "Sectors per FAT" | grep -E "[0-9]+" -o)
                FATsize=$(cat ${fsinfoFile} | grep "Fat size" | grep -E "[0-9]+ " -o)
                ReservedSectors=$(cat ${fsinfoFile} | grep "Reserved sectors" | grep -E "[0-9]+" -o)
                clusterSize=$(cat ${fsinfoFile} | grep "Sectors per cluster" | grep -E "[0-9]+" -o )
                echo "Reserved sectors ${ReservedSectors}."
                echo "Fat size ${FATSectorsSize} (${FATsize})."
                # BPB Boot part
                bpbFile="${prefix}_part${partitionNumber}_bpb.bin"
                startBpb=$((${startPartition}))
                sudo dd if=${drive} of=${bpbFile} count=1 skip=${startBpb}
                hexdump -C ${bpbFile} > ${bpbFile}.txt
                # BPB Backup Boot part
                bpbBkFile="${prefix}_part${partitionNumber}_bpbbackup.bin"
                startBpbBk=$((${startPartition} + 6))
                sudo dd if=${drive} of=${bpbBkFile} count=1 skip=${startBpbBk}
                hexdump -C ${bpbBkFile} > ${bpbBkFile}.txt
                # FS information sector
                fssecFile="${prefix}_part${partitionNumber}_fsinfosector.bin"
                startFssec=$((${startPartition}+1))
                sudo dd if=${drive} of=${fssecFile} count=1 skip=${startFssec}
                hexdump -C ${fssecFile} > ${fssecFile}.txt
                #FAT 1
                FAT1File="${prefix}_part${partitionNumber}_FAT1.bin"
                startFAT1=$((${startPartition}+${ReservedSectors}))
                echo "FAT1 at ${startFAT1} sec."
                sudo dd if=${drive} of=${FAT1File} count=${FATSectorsSize} skip=${startFAT1}
                hexdump -C ${FAT1File} > ${FAT1File}.txt
                #FAT 1
                FAT2File="${prefix}_part${partitionNumber}_FAT2.bin"
                startFAT2=$((${startFAT1}+${FATSectorsSize}))
                echo "FAT2 at ${startFAT2} sec. "
                sudo dd if=${drive} of=${FAT2File} count=${FATSectorsSize} skip=${startFAT2}
                hexdump -C ${FAT2File} > ${FAT2File}.txt
                # DATA
                startDATA=$((${startFAT2}+${FATSectorsSize}))
                echo "Data address ${startDATA}."
                # Cluster's 0..9
                for i in {0..9}
                do
                    file="${prefix}_part${partitionNumber}_cluster${i}.bin"
                    clusterAddress=$((${startDATA} + ${i}*${clusterSize}))
                    sudo dd if=${drive} of=${file} count=${clusterSize} skip=${clusterAddress}
                    hexdump -C ${file} > ${file}.txt
                done
                ;;
            *) ;;
        esac
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
    # package
    tar -cJvf ${prefix}_driveinfo.tar.xz ./${prefix}*
fi

