
source /etc/os-release
versionCode=$(echo ${VERSION_ID} | sed 's/\.//g')
url=${ID}${versionCode}
distro=${url}
arch=$(uname -m)

echo "Repository URL code is '${url}'."
sleep 1

# Add the package repositories
sudo add-apt-repository ppa:graphics-drivers
sudo apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/${url}/x86_64/7fa2af80.pub
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/3bf863cc.pub
wget https://developer.download.nvidia.com/compute/cuda/repos/${url}/x86_64/cuda-${url}.pin
sudo mv cuda-${url}.pin /etc/apt/preferences.d/cuda-repository-pin-600

sudo apt-add-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/${url}/x86_64 /" 
sudo apt-add-repository "deb http://developer.download.nvidia.com/compute/machine-learning/repos/${url}/x86_64 /"

sudo apt-get update
sudo apt-get install cuda
sudo apt install libcudnn8
sudo apt install libcudnn8-dev

cat <<EOF >> ~/.profile
if [ -d "/usr/local/cuda-11.0/bin/" ]; then
    export PATH=/usr/local/cuda-11.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi
EOF
