echo "file $@ +p > /sys/kernel/debug/dynamic_debug/control "
sudo echo "file $@ +p" > /sys/kernel/debug/dynamic_debug/control
