dateTime=$(date +%y%V%M)


# 1 - input port
port=0
if [ $? -ge 1 ]; then
    port=${1}
fi

# 2 - output file
file="logp${port}_${dateTime}.mon"
if [ $? -ge 2 ]; then
    file=${2}
fi

echo "Start logging USB port ${port} to ${file}."
sudo cat /sys/kernel/debug/usb/usbmon/${port}u | sudo tee ${file} > /dev/null
