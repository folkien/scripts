pip3 install PySide2
pip3 install zeroconf
cd ${git}
if [ ! -e Sonoff_Devices_DIY_Tools ]; then
    git clone git@github.com:folkien/Sonoff_Devices_DIY_Tools.git
    cd Sonoff_Devices_DIY_Tools
    git co v3.3.2
    cd  code/
    ./install.sh
fi