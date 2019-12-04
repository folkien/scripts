VERSION="v3.3"

#Pre requistes
sudo apt-get install -yf git wget flex bison gperf python python-pip python-setuptools python-serial python-click python-cryptography python-future python-pyparsing python-pyelftools cmake ninja-build ccache
mkdir -p /opt/espressif/

# Toolchain installation
cd /opt/
wget https://dl.espressif.com/dl/xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz
tar -xvf xtensa-esp32-elf-linux64-1.22.0-80-g6c4433a-5.2.0.tar.gz

# installation
cd /opt/espressif/
git clone -b ${VERSION}  --recursive https://github.com/espressif/esp-idf.git esp-idf3v3
cd esp-idf3v3/
/usr/bin/python -m pip install --user -r /opt/espressif/esp-idf3v3/requirements.txt
echo "export IDF_PATH=/opt/espressif/esp-idf3v3" >> env.sh
echo "export PATH=$PATH:/opt/xtensa-esp32-elf/bin/" >> env.sh
chmod a+x env.sh

