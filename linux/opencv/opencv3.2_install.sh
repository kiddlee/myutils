#!/bin/bash
#http://www.pyimagesearch.com/2016/10/24/ubuntu-16-04-how-to-install-opencv/
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install build-essential cmake pkg-config -y
sudo apt-get install libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev -y
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev libv4l-dev -y
sudo apt-get install libxvidcore-dev libx264-dev -y
sudo apt-get install libgtk-3-dev -y
sudo apt-get install libatlas-base-dev gfortran -y
sudo apt-get install python3.5-dev -y
sudo apt-get unzip -y
cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.2.0.zip
unzip opencv.zip
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.2.0.zip
unzip opencv_contrib.zip

cd ~/opencv-3.2.0/
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE　-D CMAKE_INSTALL_PREFIX=/usr/local　-D PYTHON3_EXECUTABLE=/usr/bin/python3　-D PYTHON_INCLUDE_DIR=/usr/include/python3.5　-D PYTHON_LIBRARY=/usr/lib/x86_64-Linux-gnu/libpython3.5m.so　-D PYTHON3_NUMPY_INCLUDE_DIRS=/usr/local/lib/python3.5/dist-packages/numpy/core/include　-D INSTALL_PYTHON_EXAMPLES=ON　-D INSTALL_C_EXAMPLES=OFF　-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.2.0/modules　-D PYTHON_EXECUTABLE=/usr/lib/python3　-D BUILD_EXAMPLES=ON ..

sudo make -j4
sudo make clean
sudo make
sudo make install

sudo ldconfig
