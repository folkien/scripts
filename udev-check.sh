# Check rules and state of device
if [ $# -lt 1 ]; then
    echo "Missing /dev/ path!"
    exit -1
fi

device="${1}"

# Get Device Path
devPath=$(udevadm info --name /dev/ttyACM0 --query all | grep DEVPATH | cut -c 13-)

# Query device rules
udevadm test ${devPath}
