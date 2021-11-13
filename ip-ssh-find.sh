# Scan all ip's and find ping
gatewayIP=$(route -n | grep UG | xargs -d " " -I {} echo {} | grep 0.0.0.0 -v | grep -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
ipArray=(${gatewayIP//./ })
echo "Gateway IP - ${ipArray[0]}.${ipArray[1]}.${ipArray[2]}.${ipArray[3]}."
sudo nmap -sS -p 22 ${ipArray[0]}.${ipArray[1]}.${ipArray[2]}.1-255 | grep -e report -e ssh
