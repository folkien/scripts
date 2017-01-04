# List connected usb mass storage devices.
for disk in $(ls -1 /dev/sd[a-z]) 
do
    diskName=$(basename ${disk})
    removable=$(cat /sys/block/${diskName}/removable)
    if [ ${removable} -eq 1 ]; then
        echo "${disk}"
    fi
done
