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

# Check modprobe lists
grep -r  /lib/modprobe.d/ -e "^blacklist nvidia"
if [ $? -eq 0 ]; then
    merror "[Kernel] Blacklisted nvidia!"
else
    minfo "[Kernel] Valid modprobe list."
fi

grep -r  /lib/modprobe.d/ -e "^alias nvidia off"
if [ $? -eq 0 ]; then
    merror "[Kernel] nvidia is off!"
else
    minfo "[Kernel] Valid modprobe list."
fi

# Check if module is inserted
lsmod | grep "nvidia"
if [ $? -ne 0 ]; then
    merror "[Kernel] Module not inserted!"
else
    minfo "[Kernel] Module inserted."
fi

# CUDA check
nvcc --version
if [ $? -ne 0 ]; then
    merror "[CUDA] CUDA compiler not exists!"
else
    minfo "[CUDA] Valid compiler."
fi
