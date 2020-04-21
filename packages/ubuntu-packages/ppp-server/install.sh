dir=$(pwd)
#sudo ln -sfv ${dir}/etc/ppp/options /etc/ppp/options
#sudo ln -sfv ${dir}/etc/ppp/pap-secrets /etc/ppp/pap-secrets
sudo cp -rfv ${dir}/etc/* /etc/
sudo udevadm --debug control --reload-rules && sudo udevadm --debug trigger && echo 'Rules reloaded!'

# modify access
sudo chmod a-rwx /etc/ppp/pap-secrets
sudo chmod u+rw /etc/ppp/pap-secrets

# systemd
sudo systemctl enable ppp-server.service
sudo systemctl start ppp-server.service

