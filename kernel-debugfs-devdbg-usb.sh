sudo echo "file rndis_host.c +p" > /sys/kernel/debug/dynamic_debug/control
sudo echo "file cdc_ether.c +p" > /sys/kernel/debug/dynamic_debug/control
sudo echo "file cdc-acm.c +p" > /sys/kernel/debug/dynamic_debug/control
sudo echo "file xhci-dbg.c +p" > /sys/kernel/debug/dynamic_debug/control

sudo echo "file xhci.c +p" > /sys/kernel/debug/dynamic_debug/control
sudo echo "file xhci-mem.c +p" > /sys/kernel/debug/dynamic_debug/control
sudo echo "file xhci-hub.c +p" > /sys/kernel/debug/dynamic_debug/control
sudo echo "file xhci-ring.c +p" > /sys/kernel/debug/dynamic_debug/control
