# GPU : Check if nvidia GPU exists
if [ ! -e /dev/nvidia0 ]; then
    echo "Error! No nvidia GPU found!"
    exit -1
fi

# GPU : Get graphics card name
GPUname=$(nvidia-smi --query-gpu=gpu_name --format=csv,noheader,nounits | head -n 1)

# Get : Name or RTX from full GPU name
GPUnameRTX=$(echo ${GPUname} | grep -i "RTX.[0-9]*" -o)

# NVIDIA GPUs architecture list.
archRTX2060=7.5
archRTX2070=7.5
archRTX3060=8.6
archRTX3070=8.6

# GPU architecture (default : RTX2060)
GPUarch=${archRTX2060}
# GPU architecture selection
case ${GPUnameRTX} in
        "RTX 2060" | "RTX 2070" | "RTX 2080" | "RTX 2080 Ti")
            GPUarch=${archRTX2060}
            ;;
        "RTX 3060" | "RTX 3070" | "RTX 3080" | "RTX 3090")
            GPUarch=${archRTX3060}
            ;;
        *)
            echo "Error! Unknown ${choice}!"
            exit -1
            ;;
esac

# Info : Print GPU info
echo "GPU found : ${GPUname}"
echo "GPU architecture found: ${GPUarch}"

# Confirm : Ask to continue if data is corect?
read -p "Continue? (y/n) " choice
case ${choice} in
        n|N)
            exit 0
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

echo "(OpenCV) Download and unpacking."
cd ~
# Clean before download
if [ -e opencv ]; then
    rm -rf opencv
fi
# Download and unpack

# Download if not exists
if [ ! -e opencv.zip ]; then
    wget -O opencv.zip https://github.com/opencv/opencv/archive/refs/tags/4.5.2.zip
fi
# Download if not exists
if [ ! -e opencv_contrib.zip ]; then
    wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/refs/tags/4.5.2.zip
fi
unzip opencv.zip
unzip opencv_contrib.zip
mv opencv-4.5.2 opencv
mv opencv_contrib-4.5.2 opencv_contrib

echo "(OpenCV) Configuring project."
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
    -D BUILD_EXAMPLES=OFF ..

if [ $? -ne 0 ]; then
    echo "(OpenCV) Configuration failed!"
    exit -1
fi


# Build and compile
echo "(OpenCV) Compilation."
make -j$(nproc)
if [ $? -ne 0 ]; then
    echo "(OpenCV) Compilation failed."
    exit -1
fi

# Confirm : Ask are you ready to install?
read -p "Install? (y/n) " choice
case ${choice} in
        n|N)
            exit 0
            ;;
esac

# Install in system
echo "(OpenCV) Installation in system."
sudo make install
sudo ldconfig
