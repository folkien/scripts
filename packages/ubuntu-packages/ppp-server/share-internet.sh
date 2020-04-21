if [ $# -ne 2 ];then
    echo "Missing arguments : WanInterface PPPInterface"
    exit 1
fi

wan="${1}"
ppp="${2}"

# Set IP on ppp
ip link set dev ${ppp} up

# routing internet traffic : ETH <--> PPP
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables --flush

# Ip tables change
sudo iptables -A FORWARD -i ${ppp} -o ${wan} -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i ${wan} -o ${ppp} -j ACCEPT
sudo iptables -t nat -A POSTROUTING -o ${wan}  -s 192.168.0.0/24 -j MASQUERADE

sudo mkdir -p /etc/iptables/
sudo bash -c 'iptables-save > /etc/iptables/rules.v4'
sudo bash -c 'iptables-restore < /etc/iptables/rules.v4'

sudo iptables --list
sudo iptables --list-rules
echo "Please restart/reconnect usb device!"
