pip3 install PySide2
pip3 install zeroconf
cd ${git}
if [ ! -e Sonoff_Devices_DIY_Tools ]; then
    git clone git@github.com:itead/Sonoff_Devices_DIY_Tools.git
    cd Sonoff_Devices_DIY_Tools
    g co v3.3.0
    cd  code/
    ./install.sh
fi
