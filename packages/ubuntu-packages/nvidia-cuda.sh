source /etc/os-release
source /etc/messages.sh
versionCode=$(echo ${VERSION_ID} | sed 's/\.//g')
url=${ID}${versionCode}
distro=${url}
arch=$(uname -m)

echo "Repository URL code is '$url' / $arch."
sleep 0.5

# NVIDIA keys
minfo "Nvidia keys"
sudo apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/7fa2af80.pub
sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/3bf863cc.pub
wget https://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch/cuda-$distro.pin
sudo mv cuda-${url}.pin /etc/apt/preferences.d/cuda-repository-pin-600

# NVIDIA repository
minfo "Nvidia DEB repositories : 'deb http://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch /'"
sudo apt-add-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/$distro/$arch /"
sudo apt-add-repository "deb http://developer.download.nvidia.com/compute/machine-learning/repos/$distro/$arch /"
sudo add-apt-repository ppa:graphics-drivers

# UPDATE everything
minfo "Update"
sudo apt-get update

# Install CUDA.11
minfo "Installation"
sudo apt-get install cuda-11-2
sudo apt install libcudnn8
sudo apt install libcudnn8-dev

cat <<EOF >> ~/.profile
if [ -d "/usr/local/cuda-11.2/bin/" ]; then
    export PATH=/usr/local/cuda-11.2/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-11.2/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi
EOF
