dir=$(pwd)
cd /opt/
git clone https://github.com/CISOfy/Lynis
cd Lynis
./lynis audit system -Q
cd ${dir}
