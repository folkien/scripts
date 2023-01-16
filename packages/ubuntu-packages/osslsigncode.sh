git clone git@github.com:mtrojnar/osslsigncode.git
cd osslsigncode/
sudo apt update && sudo apt install cmake libssl-dev libcurl4-openssl-dev -yf
mkdir build && cd build && cmake -S ..
cmake --build .
sudo cmake --install .
