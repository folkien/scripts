choice=$(dialog --clear --backtitle "Select" \
       --title "GPU architecture" --menu "Select GPU architecture:" \
       15 40 5 \
1 "GPU RTX2060/RTX2070" \
2 "GPU RTX3060/3070" 3>&2 2>&1 1>&3)

# GPU arch list
archRTX2060=7.5
archRTX2070=7.5
archRTX3060=8.6
archRTX3070=8.6

# GPU architecture
GPUarch=${archRTX2060}

clear
case ${choice} in
        1)
            GPUarch=${archRTX2060}
            ;;
        2)
            GPUarch=${archRTX3060}
            ;;
        *)
            echo "Error! Unknown ${choice}!"
            exit -1
            ;;
esac



#sudo apt update && sudo apt upgrade
#sudo apt install build-essential cmake git unzip pkg-config
#sudo apt install libjpeg-dev libpng-dev libtiff-dev
#sudo apt install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev
#sudo apt install libxvidcore-dev libx264-dev
#sudo apt install libgtk-3-dev
#sudo apt install libatlas-base-dev gfortran
#sudo apt install python3-dev

cd ~
wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/4.5.2.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/4.5.2.zip
unzip opencv.zip
unzip opencv_contrib.zip
mv opencv-4.5.2 opencv
mv opencv_contrib-4.5.2 opencv_contrib

cd ~/opencv
mkdir build
cd build


cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=OFF \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_ENABLE_NONFREE=ON \
    -D WITH_CUDA=ON \
    -D WITH_CUDNN=ON \
    -D OPENCV_DNN_CUDA=ON \
    -D ENABLE_FAST_MATH=1 \
    -D CUDA_FAST_MATH=1 \
    -D CUDA_ARCH_BIN=${GPUarch} \
    -D WITH_CUBLAS=1 \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
    -D HAVE_opencv_python3=ON \
    -D PYTHON_EXECUTABLE=/usr/bin/python3.8 \
    -D BUILD_EXAMPLES=OFF ..


# Build and compile
make -j$(nproc)

# Install in system
sudo make install
sudo ldconfig
