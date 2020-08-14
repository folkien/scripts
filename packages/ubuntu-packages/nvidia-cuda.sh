# Add the package repositories
sudo add-apt-repository ppa:graphics-drivers

source /etc/os-release
versionCode=$(echo ${VERSION_ID} | sed 's/\.//g')
url=${ID}${versionCode}

sudo apt-key adv --fetch-keys  http://developer.download.nvidia.com/compute/cuda/repos/${url}/x86_64/7fa2af80.pub
wget https://developer.download.nvidia.com/compute/cuda/repos/${url}/x86_64/cuda-${url}.pin
sudo mv cuda-${url}.pin /etc/apt/preferences.d/cuda-repository-pin-600

sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
sudo bash -c 'echo "deb http://developer.download.nvidia.com/compute/machine-learning/repos/ubuntu1804/x86_64 /" > /etc/apt/sources.list.d/cuda_learn.list'

sudo apt-get update
sudo apt-get install cuda

cat <<EOF >> ~/.profile
if [ -d "/usr/local/cuda-11.0/bin/" ]; then
    export PATH=/usr/local/cuda-11.0/bin${PATH:+:${PATH}}
    export LD_LIBRARY_PATH=/usr/local/cuda-11.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
fi
EOF
