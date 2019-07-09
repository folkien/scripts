# Sprawdzanie czy jestem rootem
if [ "$EUID" -ne 0 ] ; then 
  echo "Proszę, uruchom ten skypt jako root"
  exit 1
fi

# List connected usb mass storage devices.
drive=$(usb-select-drive)
if [ -n "$drive" ]; then
    clear
    fdisk -l ${drive}
    mountPath="/media/${drive}"
    mkdir -p ${mountPath}
    mount -v ${drive} ${mountPath}
    echo ${drive}
fi
