#poprawki do dyskow SSD
#wlaczamy trimm'a
sed -i 's/exec fstrim-all/exec fstrim-all --no-model-check/g' /etc/cron.weekly/fstrim
sudo fstrim /
