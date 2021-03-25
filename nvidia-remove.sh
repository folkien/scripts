sudo apt remove --purge cuda-*
sudo apt remove --purge nvidia-*
#sudo apt remove --purge

sudo apt-get -o Dpkg::Options::="--force-overwrite" --fix-broken install


# Install again
#sudo apt-get -o Dpkg::Options::="--force-overwrite" install cuda-10-0
