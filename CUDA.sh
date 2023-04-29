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
wget https://bitbucket.org/dependencies-ranjan/dependencies/downloads/cudnn-local-repo-ubuntu2004-8.9.0.131_1.0-1_amd64.deb
sudo dpkg -i cudnn-local-repo-ubuntu2004-8.9.0.131_1.0-1_amd64.deb
