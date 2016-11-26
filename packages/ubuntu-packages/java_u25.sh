wget http://sdlc-esd.sun.com/ESD6/JSCDL/jdk/8u25-b17/jre-8u25-linux-i586.tar.gz?AuthParam=1416696451_f2a82d73c8521c6b6619e662ba5df07c&GroupName=JSC&FilePath=/ESD6/JSCDL/jdk/8u25-b17/jre-8u25-linux-i586.tar.gz&File=jre-8u25-linux-i586.tar.gz&BHost=javadl.sun.com
sudo mkdir /opt/java
sudo mkdir /usr/lib/firefox/plugins
sudo tar zxvf jre-8u25-linux-i586.tar.gz -C /opt/java

# Tworzenie dowiązań symbolicznych
sudo cd /usr/lib/firefox/plugins
sudo ln -s /opt/java/jre1.8.0_25/lib/i386/libnpjp2.so libnpjp2.so
sudo cd /usr/lib/mozilla/plugins
sudo ln -s /opt/java/jre1.8.0_25/lib/i386/libnpjp2.so libnpjp2.so

