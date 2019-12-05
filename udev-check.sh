# Check rules and state of device
if [ $# -lt 1 ]; then
    echo "Missing /dev/ path!"
    exit -1
fi

device="${1}"

# Get Device Path
devPath=$(udevadm info --name ${device} --query all | grep "DEVPATH\=.*" -o | cut -c 9-)
echo "DEVPATH=${devPath}"

# Query device rules
udevadm test ${devPath}
