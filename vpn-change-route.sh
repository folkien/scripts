# Delete the default route
sudo route del default
# Change the default route back to your router
sudo route add default gw 192.168.1.1
# Add explicit route for ssh target to go through the tunnel
sudo route add 192.168.100.157/32 ppp0
