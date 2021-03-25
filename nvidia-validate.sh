source /etc/messages.sh

# Check PCI visibility
lspci -k | grep -A 2 -E "(VGA|3D)" | grep NVIDIA
if [ $? -ne 0 ]; then
    merror "PCI doesn't see VGA for NVIDIA!"
else
    minfo "[PCI] Valid NVIDIA."
fi

# Check kernel module exists in directory
find /lib/modules/$(uname -r)/ | grep nvidia.ko
if [ $? -ne 0 ]; then
    merror "[Kernel] Module doesnt exists!"
else
    minfo "[Kernel] Valid module."
fi

# Check nouveau exists
lsmod | grep nouveau
if [ $? -eq 0 ]; then
    merror "[Kernel] Nouveau inserted!"
else
    minfo "[Kernel] Valid, nouveau not inserted."
fi
