#google python library
wget https://gdata-python-client.googlecode.com/files/gdata-2.0.18.tar.gz
tar -xvf gdata-2.0.18.tar.gz 
cd gdata-2.0.18/
python setup.py build
sudo python setup.py install
cd ..

#google terminal tools
wget https://googlecl.googlecode.com/files/googlecl_0.9.14-2_all.deb
sudo dpkg -i googlecl_0.9.14-2_all.deb 
