# Deploy script of embedded kernel.
if [ $# -lt 1 ]; then
    echo "Please give me full disk path as an argument. For example /dev/sdc1."
    exit 1
fi
DISK=$1

if [ ! -e .config ]; then
    echo "This directory is not a kernel repository. Missing .config!"
    exit 1
fi

#Finding tar archive
TARARCHIVE=$(ls linux*tar.bz2 -1t | head -n 1)


MOUNTDIRECTORY=$(echo $(basename ${DISK})_$(date +%s))
[ -e /media/${MOUNTDIRECTORY} ] && echo "Oops! Mount directory exists, i don't know what to do!" && error 1

echo "Creating directory."
sudo mkdir -vp /media/${MOUNTDIRECTORY}

echo "Mounting."
sudo mount ${DISK} /media/${MOUNTDIRECTORY}

echo "Unpack."
sudo tar -xvf ${TARARCHIVE} -C /media/${MOUNTDIRECTORY}/

echo "Umount, sync data and clean."
sudo umount -l /media/${MOUNTDIRECTORY}
sudo rm -rfv /media/${MOUNTDIRECTORY}
