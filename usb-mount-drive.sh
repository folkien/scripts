# Sprawdzanie czy jestem rootem
if [ "$EUID" -ne 0 ] ; then 
  echo "Proszę, uruchom ten skypt jako root"
  exit 1
fi


# List connected usb mass storage devices.
drive=$(usb-select-drive)
if [ -n "$drive" ]; then
    mountPath="/media/${drive}"
    mkdir -p ${mountPath}
    # Check silent
    if [ $1 == "--silent" ]; then
        mount -v ${drive} ${mountPath} &> /dev/null
    else
        clear
        fdisk -l ${drive}
        mount -v ${drive} ${mountPath}
    fi
    echo ${drive}
fi
