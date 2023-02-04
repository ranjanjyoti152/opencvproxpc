#!/bin/bash

# Update the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install NVIDIA drivers
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt-get update -y
sudo apt-get install nvidia-driver-450 -y

# Install AI-related applications
sudo apt-get install python3-pip
pip3 install numpy scipy pandas matplotlib
pip3 install tensorflow keras pytorch
pip3 install opencv-python-headless opencv-python-cuda

# Update the system once again
sudo apt-get update -y
sudo apt-get upgrade -y

# Install CUDA dependencies
sudo apt-get update
sudo apt-get -y install build-essential
sudo apt-get -y install freeglut3-dev
sudo apt-get -y install libx11-dev
sudo apt-get -y install libxi-dev
sudo apt-get -y install libxmu-dev
sudo apt-get -y install libgl1-mesa-glx
sudo apt-get -y install libglu1-mesa
sudo apt-get -y install libglu1-mesa-dev
sudo apt-get -y install libglfw3
sudo apt-get -y install libglfw3-dev

# Download CUDA Toolkit
wget https://developer.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_440.33.01_linux.run

# Install CUDA Toolkit
chmod +x cuda_10.2.89_440.33.01_linux.run
sudo ./cuda_10.2.89_440.33.01_linux.run

# Add CUDA to PATH
echo 'export PATH="/usr/local/cuda-10.2/bin:$PATH"' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH="/usr/local/cuda-10.2/lib64:$LD_LIBRARY_PATH"' >> ~/.bashrc
source ~/.bashrc

# Download OpenCV
wget -O opencv.zip https://github.com/opencv/opencv/archive/4.5.2.zip
unzip opencv.zip
cd opencv-4.5.2/

# Compile OpenCV with CUDA support
mkdir build
cd build/
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=/usr/local \
      -D WITH_CUDA=ON \
      -D CUDA_ARCH_BIN=7.5 \
      -D CUDA_ARCH_PTX="" \
      -D WITH_CUBLAS=ON \
      -D ENABLE_FAST_MATH=ON \
      -D CUDA_FAST_MATH=ON \
      -D ENABLE_NEON=ON \
      -D WITH_LIBV4L=ON \
      -D BUILD_opencv_python2=OFF \
      -D BUILD_opencv_python3=ON \
      -D BUILD_TESTS=OFF \
      -D BUILD_PERF_TESTS=OFF \
      -D BUILD_EXAMPLES=OFF ..
make -j $(nproc)
sudo make install

# Update dynamic linker cache
sudo ldconfig

# Install dependencies
sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add NVIDIA GPU driver repository
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
  sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
  sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

# Install nvidia-docker
sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd

# Test nvidia-docker installation
docker run --rm nvidia/cuda:10.2-base nvidia-smi

#!/bin/bash

# Install dependencies
sudo apt-get update
sudo apt-get install -y python3-pip

# Upgrade pip
pip3 install --upgrade pip

# Install TensorFlow
pip3 install tensorflow

# Test TensorFlow installation
python3 -c "import tensorflow as tf; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"

# Update the system
sudo apt-get update
sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y \
    build-essential \
    cmake \
    pkg-config \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libgtk-3-dev \
    libhdf5-dev \
    libatlas-base-dev \
    gfortran \
    python3-dev \
    python3-pip \
    curl

# Upgrade pip
pip3 install --upgrade pip

# Install TensorFlow
pip3 install tensorflow

# Install OpenCV
pip3 install opencv-python
pip3 install opencv-python-headless

# Install other AI libraries
pip3 install numpy
pip3 install matplotlib
pip3 install scikit-learn
pip3 install scikit-image
pip3 install Pillow

# Test the installation
python3 -c "import tensorflow as tf; import cv2; import numpy as np; print(tf.reduce_sum(tf.random.normal([1000, 1000])))"

#!/bin/bash

# Update the system
sudo apt-get update
sudo apt-get upgrade -y

# Install dependencies
sudo apt-get install -y \
    build-essential \
    cmake \
    pkg-config \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libv4l-dev \
    libxvidcore-dev \
    libx264-dev \
    libgtk-3-dev \
    libhdf5-dev \
    libatlas-base-dev \
    gfortran \
    python3-dev \
    python3-pip \
    curl

# Install other AI libraries
pip3 install numpy
pip3 install matplotlib
pip3 install scikit-learn
pip3 install scikit-image
pip3 install Pillow

# Set up a virtual environment for the project
python3 -m venv myenv
source myenv/bin/activate
pip install --upgrade pip
pip install tensorflow
pip install opencv-python
pip install numpy
pip install matplotlib
pip install scikit-learn
pip install scikit-image
pip install Pillow
