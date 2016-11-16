# Delete the default route
sudo route del default
# Change the default route back to your router
sudo route add default gw 192.168.11.254
# Add explicit route for ssh target to go through the tunnel
sudo route add 192.168.100.157/32 ppp0
sudo route add 192.168.100.24/32 ppp0
