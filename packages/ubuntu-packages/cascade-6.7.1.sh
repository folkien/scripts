#Opencascade
wget http://files.opencascade.com/OCCT/OCC_6.7.1_release/opencascade-6.7.1.tgz
tar -xvf opencascade-6.7.1.tgz
cd opencascade-6.7.1/
./build_configure
./configure
make
sudo make install
