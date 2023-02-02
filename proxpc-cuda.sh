echo "###############################################################################################################################################"
echo "##############################                                                                              ###################################"
echo "##############################                            WELCOME TO PROXPC                                 ###################################"
echo "##############################                                                                              ###################################"
echo "###############################################################################################################################################"

#Update Pakages 
sudo apt update 
sudo apt upgrade -y
sudo apt install net-tools -y
sudo apt install openssh-server -y
sudo apt install curl -y

# Purge Existing Dependencies
sudo apt -y remove --purge "^libcuda.*"
sudo apt -y remove --purge "^cuda.*"
sudo apt -y remove --purge "^libnvidia.*"
sudo apt -y remove --purge "^nvidia.*"
sudo apt -y remove --purge "^tensorrt.*" 

# Purge Existing Dependencies
sudo apt-get -y --purge remove "*cublas*" "cuda*" "nsight*" 
sudo apt-get -y --purge remove "*nvidia*"
sudo apt remove -y --autoremove nvidia-cuda-toolkit


sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt install nvidia-driver-520 -y
sudo dpkg --configure -a

# Install CUDA-11-6
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
cd ~
if [ -f "$(ls cuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb)" ]; then
echo -e "\ncuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb present\n"
else
wget https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb
fi
sudo dpkg -i cuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda-11-6

# Install CUDA-11-5
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
cd ~
if [ -f "$(ls cuda-repo-ubuntu2004-11-5-local_11.5.2-495.29.05-1_amd64.deb)" ]; then
echo -e "\ncuda-repo-ubuntu2004-11-5-local_11.5.2-495.29.05-1_amd64.deb present\n"
else
wget https://developer.download.nvidia.com/compute/cuda/11.5.2/local_installers/cuda-repo-ubuntu2004-11-5-local_11.5.2-495.29.05-1_amd64.deb
fi
sudo dpkg -i cuda-repo-ubuntu2004-11-5-local_11.5.2-495.29.05-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-5-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda-11-5

# Install CUDA-11-4
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
cd ~
if [ -f "$(ls cuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb)" ]; then
echo -e "\ncuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb present\n"
else
wget https://developer.download.nvidia.com/compute/cuda/11.4.1/local_installers/cuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb
fi
sudo dpkg -i cuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-4-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda-11-4

# Install CUDA-11-2
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
cd ~
if [ -f "$(ls cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb)" ]; then
echo -e "\ncuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb present\n"
else
wget https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb
fi
sudo dpkg -i cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-2-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda-11-2


sudo apt --fix-broken -y install 
sudo dpkg --force-all -i /var/cuda-repo-ubuntu2004-11-2-local/./cuda-cudart-11-2_11.2.152-1_amd64.deb

# Install CUDA-11-1
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
cd ~
if [ -f "$(ls cuda-repo-ubuntu2004-11-1-local_11.1.1-455.32.00-1_amd64.deb)" ]; then
echo -e "\ncuda-repo-ubuntu2004-11-1-local_11.1.1-455.32.00-1_amd64.deb present\n"
else
wget https://developer.download.nvidia.com/compute/cuda/11.1.1/local_installers/cuda-repo-ubuntu2004-11-1-local_11.1.1-455.32.00-1_amd64.deb
fi
sudo dpkg -i cuda-repo-ubuntu2004-11-1-local_11.1.1-455.32.00-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-1-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda-11-1
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
pip install scikit-imageecho "**********************************************************************************************************************************************"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>                                                                   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>                         THANK YOU                                 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>                                                                   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo "***********************************************************************************************************************************************"

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> REBOOT YOUR MACHINE TO APPLY CHANGES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
