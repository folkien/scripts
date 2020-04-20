# Usb debuging enabled- for cases when debug is needed

# Enable module for usb monitoring
# Creates binary entries for every host controloler
# /dev/usbmonX
# - use tcpdump to read this and wireshark to analyze
# Creates text entries for every host controloler
# /sys/kernel/debug/usb/usbmon/${port}u 
# - use cat and vusb-analyzer to parse this

sudo modprobe usbmon

if [ ! -e /proc/bus/usb/devices ]; then
    sudo mkdir /proc/bus/usb/
    sudo mount -t usbfs none /proc/bus/usb
fi

# 1 - input port
port=0
if [ $? -ge 1 ]; then
    port=${1}
fi
usbPortPath="/sys/kernel/debug/usb/usbmon/${port}u"
echo "Selected USB port to debug is ${usbPortPath}."

# 2 - output file
dateTime=$(date +%y%V%M)
file="logUsbP${port}_${dateTime}.mon"
if [ $? -ge 2 ]; then
    file=${2}
fi

echo "Start logging USB port ${port} to ${file}."
sudo cat /sys/kernel/debug/usb/usbmon/${port}u | sudo tee ${file} > /dev/null
