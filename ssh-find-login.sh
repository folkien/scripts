if [ $# -lt 2 ]; then
    echo "Give args : login password!"
    exit -1
fi

login="${1}"
password="${2}"

# Scan all ip's and find ping
gatewayIP=$(route -n | grep UG | xargs -d " " -I {} echo {} | grep 0.0.0.0 -v | grep -E "([0-9]{1,3}[\.]){3}[0-9]{1,3}")
ipArray=(${gatewayIP//./ })
echo "Gateway IP - ${ipArray[0]}.${ipArray[1]}.${ipArray[2]}.${ipArray[3]}."
sudo -H nmap -sS -p 22 ${ipArray[0]}.${ipArray[1]}.${ipArray[2]}.1-255 | grep report | grep -o "${ipArray[0]}.${ipArray[1]}.${ipArray[2]}.*" | while read ipHost
do
    echo "Try ${login}@${ipHost}."
    sshpass -p "${password}" ssh -tt -v -oStrictHostKeyChecking=no ${login}@${ipHost}
done
