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
sudo apt-get install python2.7-dev python3.5-dev -y
sudo apt-get unzip
cd ~
wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.3.0.zip
unzip opencv.zip
wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.3.0.zip
unzip opencv_contrib.zip
cd ~
wget https://bootstrap.pypa.io/get-pip.py
sudo python get-pip.py
sudo pip install numpy
sudo pip install scipy
cd ~/opencv-3.3.0/
mkdir build
cd build
sudo cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib-3.1.0/modules \
    -D PYTHON_EXECUTABLE=/usr/bin/python \
    -D BUILD_EXAMPLES=ON ..
sudo make
sudo make install
sudo ldconfig
