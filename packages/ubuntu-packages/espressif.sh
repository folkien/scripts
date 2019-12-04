BRANCHVERSION="release/v4.0"
VERSION="99fb9a3f7c28c5fa12b1bd4aa6fb7b622d841326"

#Pre requistes
sudo apt-get install -yf git wget flex bison gperf python python-pip python-setuptools python-serial python-click python-cryptography python-future python-pyparsing python-pyelftools cmake ninja-build ccache
mkdir -p /opt/espressif/

# installation
cd /opt/espressif/
git clone -b ${BRANCHVERSION} --recursive https://github.com/espressif/esp-idf.git
cd esp-idf/
git checkout ${VERSION}
./install.sh

