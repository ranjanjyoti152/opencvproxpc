#!/bin/bash
echo "###############################################################################################################################################"
echo "##############################                                                                              ###################################"
echo "##############################                            WELCOME TO PROXPC                                 ###################################"
echo "##############################                                                                              ###################################"
echo "###############################################################################################################################################"


# Purge Existing Dependencies
sudo apt -y remove --purge "^libcuda.*"
sudo apt -y remove --purge "^cuda.*"
sudo apt -y remove --purge "^libnvidia.*"
sudo apt -y remove --purge "^nvidia.*"
sudo apt -y remove --purge "^tensorrt.*" 

# Update And Upgrade everything 
sudo apt update 
sudo apt upgrade -y
sudo apt install gparted -y
sudo apt autoremove -y
sudo apt install git -y
sudo apt install net-tools -y
sudo apt install openssh-server -y
sudo apt install curl -y
gsettings set org.gnome.desktop.background picture-uri https://raw.githubusercontent.com/ranjanjyoti152/opencvproxpc/main/Wallpaper-01.jpg


echo "########################################### Installing Nvidia Drivers #############################################################################"
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt install nvidia-driver-510 -y
sudo dpkg --configure -a


wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-60
wget https://developer.download.nvidia.com/compute/cuda/11.6.1/local_installers/cuda-repo-ubuntu2004-11-6-local_11.6.1-510.47.03-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-11-6-local_11.6.1-510.47.03-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda

sudo nano ~/.bashrc

#paste these 2 lines at the end of bashrc file
export LD_LIBRARY_PATH="/usr/local/cuda/lib64:/usr/local/cuda-11.6/extras/CUPTI/lib64:$LD_LIBRARY_PATH"
export PATH="/usr/local/cuda-11.6/bin:$PATH"
source ~/.bashrc

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1804/x86_64/cuda-ubuntu1804.pin
sudo mv cuda-ubuntu1804.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/11.4.1/local_installers/cuda-repo-ubuntu1804-11-4-local_11.4.1-470.57.02-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1804-11-4-local_11.4.1-470.57.02-1_amd64.deb
sudo apt-key add /var/cuda-repo-ubuntu1804-11-4-local/7fa2af80.pub
sudo apt-get update
sudo apt-get -y install cuda

wget https://developer.nvidia.com/compute/cudnn/secure/8.4.0/local_installers/11.6/cudnn-local-repo-ubuntu2004-8.4.0.27_1.0-1_amd64.deb
sudo dpkg -i cudnn-local-repo-ubuntu2004-8.4.0.27_1.0-1_amd64.deb
sudo apt-get update
sudo apt install libcudnn8=8.4.0.27-1+cuda11.6 libcudnn8-dev=8.4.0.27-1+cuda11.6

wget https://developer.nvidia.com/compute/machine-learning/tensorrt/secure/8.2.5.1/local_repos/nv-tensorrt-repo-ubuntu2004-cuda11.4-trt8.2.5.1-ga-20220505_1-1_amd64.deb
sudo dpkg -i nv-tensorrt-repo-ubuntu2004-cuda11.4-trt8.2.5.1-ga-20220505_1-1_amd64.deb
sudo apt-key add /var/nv-tensorrt-repo-ubuntu2004-cuda11.4-trt8.2.5.1-ga-20220505/82307095.pub
sudo apt-get update
sudo apt install tensorrt

sudo apt -y install \
libssl1.1 \
libgstreamer1.0-0 \
gstreamer1.0-tools \
gstreamer1.0-plugins-good \
gstreamer1.0-plugins-bad \
gstreamer1.0-plugins-ugly \
gstreamer1.0-libav \
libgstrtspserver-1.0-0 \
libjansson4 \
libyaml-cpp-dev \
gcc \
make \
git \
python3

wget https://developer.nvidia.com/deepstream-6.1_6.1.0-1_amd64.deb
sudo dpkg -i deepstream-6.1_6.1.0-1_amd64.deb
sudo apt --fix-broken install -y
git clone https://github.com/edenhill/librdkafka.git
cd librdkafka
#git reset --hard 7101c2310341ab3f4675fc565f64f0967e135a6a
./configure
sudo make -j
sudo make install
sudo mkdir -p /opt/nvidia/deepstream/deepstream-6.1/lib
sudo cp /usr/local/lib/librdkafka* /opt/nvidia/deepstream/deepstream-6.1/lib
sudo dpkg -i deepstream-6.1_6.1.0-1_amd64.deb


cd ~/Downloads 
git clone https://github.com/marcoslucianops/DeepStream-Yolo.git
cd DeepStream-Yolo

CUDA_VER=11.6 make -C nvdsinfer_custom_impl_Yolo


git clone https://github.com/WongKinYiu/yolov7  # clone
cd yolov7
pip install -r requirements.txt  # install

#here we are testing for yolov5n
wget hhttps://github.com/WongKinYiu/yolov7/releases/download/v0.1/yolov7.pt

cd ..
cp -r utils/gen_wts_yoloV7.py yolov7/gen_wts_yoloV7.py
cd yolov7 
python3 gen_wts_yoloV7.py -w yolov7.pt

#Copy generated cfg and wts files to DeepStream-Yolo folder
cp -r yolov7n.cfg ~/Downloads/DeepStream-Yolo
cp -r yolov7n.wts ~/Downloads/DeepStream-Yolo

