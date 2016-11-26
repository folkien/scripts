# pobieranie javy i instalacja
#wget http://sdlc-esd.sun.com/ESD6/JSCDL/jdk/8u40-b26/jre-8u40-linux-x64.tar.gz?GroupName=JSC&FilePath=/ESD6/JSCDL/jdk/8u40-b26/jre-8u40-linux-x64.tar.gz&BHost=javadl.sun.com&File=jre-8u40-linux-x64.tar.gz&AuthParam=1428875852_84ec0381c55d9305fcf40ac1e7fb97d7&ext=.gz
sudo mkdir /opt/java
sudo mkdir /usr/lib/firefox/plugins
sudo tar zxvf ./jre-8u40-linux-x64.tar.gz -C /opt/java

# Tworzenie dowiązań symbolicznych
cd /usr/lib/firefox/plugins
sudo rm libnpjp2.so
sudo ln -s /opt/java/jre1.8.0_40/lib/amd64/libnpjp2.so libnpjp2.so
cd /usr/lib/mozilla/plugins
sudo rm libnpjp2.so
sudo ln -s /opt/java/jre1.8.0_40/lib/amd64/libnpjp2.so libnpjp2.so

