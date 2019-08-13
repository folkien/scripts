echo "file $@ -p > /sys/kernel/debug/dynamic_debug/control "
sudo -s
echo "file $@ -p" > /sys/kernel/debug/dynamic_debug/control
exit
