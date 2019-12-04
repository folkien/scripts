#Pre requistes
sudo apt-get install -yf git wget flex bison gperf python python-pip python-setuptools python-serial python-click python-cryptography python-future python-pyparsing python-pyelftools cmake ninja-build ccache
mkdir -p /opt/espressif/
cd /opt/espressif/
git clone --recursive https://github.com/espressif/esp-idf.git
cd esp-idf/
git checkout v4.0-beta2
./install.sh

