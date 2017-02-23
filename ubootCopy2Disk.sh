# Deploy script of embedded uboot.
if [ $# -lt 1 ]; then
    echo "Please give me full disk path as an argument. For example /dev/sdc1."
    exit 1
fi
DISK=$1

if [ ! -e boards.cfg ]; then
    echo "This directory is not a uboot repository. Missing boards.cfg!"
    exit 1
fi

MOUNTDIRECTORY=$(echo $(basename ${DISK})_$(date +%s))
[ -e /media/${MOUNTDIRECTORY} ] && echo "Oops! Mount directory exists, i don't know what to do!" && error 1

echo "Creating directory."
sudo mkdir -vp /media/${MOUNTDIRECTORY}

echo "Mounting."
sudo mount ${DISK} /media/${MOUNTDIRECTORY}

echo "Copying."
sudo cp -rfv ./u-boot.img /media/${MOUNTDIRECTORY}/u-boot.img
[ -e MLO ] && sudo cp -rfv ./MLO /media/${MOUNTDIRECTORY}/MLO

echo "Umount, sync data and clean."
sudo umount /media/${MOUNTDIRECTORY}
sudo rm -rfv /media/${MOUNTDIRECTORY}
