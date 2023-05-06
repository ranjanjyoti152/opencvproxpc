#!/bin/bash
echo "###############################################################################################################################################"
echo "##############################                                                                              ###################################"
echo "##############################                            WELCOME TO PROXPC                                 ###################################"
echo "##############################                                                                              ###################################"
echo "###############################################################################################################################################"


# Purge Existing Dependencies
sudo apt -y remove --purge "^cuda.*"
sudo apt -y remove --purge "^nvidia.*"


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


echo "Installation Of Brave Browser Completed"

echo "########################################### Installing Nvidia Drivers #############################################################################"
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt install nvidia-driver-530 -y
sudo dpkg --configure -a
echo "########################################### Installing Nvidia CUDA #############################################################################"
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.1.1/local_installers/cuda-repo-ubuntu2004-12-1-local_12.1.1-530.30.02-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2004-12-1-local_12.1.1-530.30.02-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2004-12-1-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda
sudo cp /var/cudnn-local-repo-ubuntu2004-8.9.0.131/cudnn-local-80259EFB-keyring.gpg /usr/share/keyrings/
wget https://bitbucket.org/dependencies-ranjan/dependencies/downloads/cudnn-local-repo-ubuntu2004-8.9.0.131_1.0-1_amd64.deb
sudo dpkg -i cudnn-local-repo-ubuntu2004-8.9.0.131_1.0-1_amd64.deb
sudo cp /var/cudnn-local-repo-ubuntu2004-8.9.0.131/cudnn-local-80259EFB-keyring.gpg /usr/share/keyrings/
wget https://bitbucket.org/stackcuda/download/downloads/cuddn.deb
sudo dpkg -i cuddn.deb
sudo cp /var/cudnn-local-repo-*/cudnn-local-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get install -y libcudnn8
sudo apt-get install -y libcudnn8-dev
sudo apt-get -y install libcudnn8-samples
wget https://bitbucket.org/dependencies-ranjan/dependencies/downloads/cudnn-linux-x86_64-8.9.1.23_cuda12-archive.tar.xz
tar -xvf cudnn-linux-x86_64-8.9.1.23_cuda12-archive.tar.xz
sudo cp cudnn-*-archive/include/cudnn*.h /usr/local/cuda/include 
sudo cp -P cudnn-*-archive/lib/libcudnn* /usr/local/cuda/lib64 
sudo chmod a+r /usr/local/cuda/include/cudnn*.h /usr/local/cuda/lib64/libcudnn*
sudo apt -y install nvidia-cuda-toolkit
