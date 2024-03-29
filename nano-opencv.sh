#!/bin/bash
username=$USER
read -p "Enter Machine Password again please: " password 
cd

sudo apt update
sudo apt upgrade
sudo apt autoremove -y
free -m
sudo rm -rf ~/opencv
sudo rm -rf ~/opencv_contrib
sudo sh -c "echo '/usr/local/cuda/lib64' >> /etc/ld.so.conf.d/nvidia-tegra.conf"
sudo ldconfig
sudo apt-get install build-essential cmake git unzip pkg-config zlib1g-dev -y
sudo apt-get install libjpeg-dev libjpeg8-dev libjpeg-turbo8-dev -y
sudo apt-get install libpng-dev libtiff-dev libglew-dev -y
sudo apt-get install libavcodec-dev libavformat-dev libswscale-dev -y
sudo apt-get install libgtk2.0-dev libgtk-3-dev libcanberra-gtk* -y
sudo apt-get install python-dev python-numpy python-pip -y
sudo apt-get install python3-dev python3-numpy python3-pip -y
sudo apt-get install libxvidcore-dev libx264-dev libgtk-3-dev -y
sudo apt-get install libtbb2 libtbb-dev libdc1394-22-dev libxine2-dev -y
sudo apt-get install gstreamer1.0-tools libgstreamer-plugins-base1.0-dev -y
sudo apt-get install libgstreamer-plugins-good1.0-dev -y
sudo apt-get install libv4l-dev v4l-utils v4l2ucp qv4l2 -y
sudo apt-get install libtesseract-dev libxine2-dev libpostproc-dev -y
sudo apt-get install libavresample-dev libvorbis-dev -y
sudo apt-get install libfaac-dev libmp3lame-dev libtheora-dev -y
sudo apt-get install libopencore-amrnb-dev libopencore-amrwb-dev -y
sudo apt-get install libopenblas-dev libatlas-base-dev libblas-dev -y
sudo apt-get install liblapack-dev liblapacke-dev libeigen3-dev gfortran -y
sudo apt-get install libhdf5-dev libprotobuf-dev protobuf-compiler -y
sudo apt-get install libgoogle-glog-dev libgflags-dev -y
cd ~
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.6.0.zip
wget -O opencv_contrib.zip https://github.com/opencv/opencv_contrib/archive/4.6.0.zip
unzip opencv.zip
unzip opencv_contrib.zip
mv opencv-4.6.0 opencv
mv opencv_contrib-4.6.0 opencv_contrib
rm opencv.zip
rm opencv_contrib.zip
cd ~/opencv
mkdir build
cd build

cmake -D CMAKE_BUILD_TYPE=RELEASE \
-D CMAKE_INSTALL_PREFIX=/usr \
-D OPENCV_EXTRA_MODULES_PATH=~/opencv_contrib/modules \
-D EIGEN_INCLUDE_PATH=/usr/include/eigen3 \
-D WITH_OPENCL=OFF \
-D WITH_CUDA=ON \
-D CUDA_ARCH_BIN=7.5 \
-D CUDA_ARCH_PTX="" \
-D WITH_CUDNN=ON \
-D WITH_CUBLAS=ON \
-D ENABLE_FAST_MATH=ON \
-D CUDA_FAST_MATH=ON \
-D OPENCV_DNN_CUDA=ON \
-D ENABLE_NEON=ON \
-D WITH_QT=OFF \
-D WITH_OPENMP=ON \
-D BUILD_TIFF=ON \
-D WITH_FFMPEG=ON \
-D WITH_GSTREAMER=ON \
-D WITH_TBB=ON \
-D BUILD_TBB=ON \
-D BUILD_TESTS=OFF \
-D WITH_EIGEN=ON \
-D WITH_V4L=ON \
-D WITH_LIBV4L=ON \
-D OPENCV_ENABLE_NONFREE=ON \
-D INSTALL_C_EXAMPLES=OFF \
-D INSTALL_PYTHON_EXAMPLES=OFF \
-D PYTHON3_PACKAGES_PATH=/usr/lib/python3/dist-packages \
-D OPENCV_GENERATE_PKGCONFIG=ON \
-D BUILD_EXAMPLES=OFF ..

make -j4
gsettings set org.gnome.desktop.background picture-uri https://raw.githubusercontent.com/ranjanjyoti152/opencvproxpc/main/Wallpaper-01.jpg
