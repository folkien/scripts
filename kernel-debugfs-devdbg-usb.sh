sudo -s
# HID
echo "file hid-core.h +p" > /sys/kernel/debug/dynamic_debug/control
echo "file hid-pidff.h +p" > /sys/kernel/debug/dynamic_debug/control
# CORE
echo "file hcd-pci.c +p" > /sys/kernel/debug/dynamic_debug/control
echo "file usb.c +pfl" > /sys/kernel/debug/dynamic_debug/control
echo "file urb.c +pfl" > /sys/kernel/debug/dynamic_debug/control
echo "file usb-acpi.c +p" > /sys/kernel/debug/dynamic_debug/control
# NET
echo "file rndis_host.c +p" > /sys/kernel/debug/dynamic_debug/control
echo "file cdc_ether.c +p" > /sys/kernel/debug/dynamic_debug/control
echo "file cdc-acm.c +pfl" > /sys/kernel/debug/dynamic_debug/control
# XHCI controller
echo "file xhci-dbg.c +p" > /sys/kernel/debug/dynamic_debug/control
echo "file xhci.c +p" > /sys/kernel/debug/dynamic_debug/control
echo "file xhci-mem.c +p" > /sys/kernel/debug/dynamic_debug/control
echo "file xhci-hub.c +p" > /sys/kernel/debug/dynamic_debug/control
echo "file xhci-ring.c +p" > /sys/kernel/debug/dynamic_debug/control
