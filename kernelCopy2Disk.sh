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

if [ -e .devicetreename  ]; then
    DTBNAME=$(cat .devicetreename)
else
    echo "Plase specify name of output kernel image, for example zImage, uImage"
    DTBNAME=$(filelist ./arch/arm/boot/dts/)
    echo ${DTBNAME} > .devicetreename
    echo .devicetreename > .gitignore
fi


if [ -e .kernelname  ]; then
    KERNELNAME=$(cat .kernelname)
else
    echo "Plase specify name of output kernel image, for example zImage, uImage"
    read KERNELNAME
    echo ${KERNELNAME} > .kernelname
    echo .kernelname > .gitignore
fi

MOUNTDIRECTORY=$(echo $(basename ${DISK})_$(date +%s))
[ -e /media/${MOUNTDIRECTORY} ] && echo "Oops! Mount directory exists, i don't know what to do!" && error 1

echo "Creating directory."
sudo mkdir -vp /media/${MOUNTDIRECTORY}

echo "Mounting."
sudo mount ${DISK} /media/${MOUNTDIRECTORY}

echo "Copying."
sudo cp -rfv ./arch/arm/boot/${KERNELNAME} /media/${MOUNTDIRECTORY}/${KERNELNAME}0
sudo cp -rfv ./arch/arm/boot/dts/${DTBNAME} /media/${MOUNTDIRECTORY}/devicetree0

echo "Umount, sync data and clean."
sudo umount /media/${MOUNTDIRECTORY}
sudo rm -rfv /media/${MOUNTDIRECTORY}
