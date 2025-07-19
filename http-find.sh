# Scan all ip's and find 80s port
gatewayIP=$(route -n | grep UG | xargs -d " " -I {} echo {} | grep 0.0.0.0 -v | grep -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
ipArray=(${gatewayIP//./ })
echo "Gateway IP - ${ipArray[0]}.${ipArray[1]}.${ipArray[2]}.${ipArray[3]}, scanning port 80"

nmap -p 80 ${ipArray[0]}.${ipArray[1]}.${ipArray[2]}.1-255  | grep open -B 5
