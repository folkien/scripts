VERSION="v4.0-beta2"

#Pre requistes
sudo apt-get install -yf git wget flex bison gperf python python-pip python-setuptools python-serial python-click python-cryptography python-future python-pyparsing python-pyelftools cmake ninja-build ccache
mkdir -p /opt/espressif/

# installation
cd /opt/espressif/
git clone -b ${VERSION}  --recursive https://github.com/espressif/esp-idf.git
cd esp-idf/
./install.sh

