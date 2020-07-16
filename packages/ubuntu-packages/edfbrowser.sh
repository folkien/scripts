  sudo apt-get update
  sudo apt-get install g++ make git qtbase5-dev-tools qtbase5-dev qt5-default
  git clone https://gitlab.com/Teuniz/EDFbrowser.git
  cd EDFbrowser
  qmake
  make -j4
  sudo make install
  edfbrowser
