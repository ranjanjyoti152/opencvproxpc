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

sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt install nvidia-driver-520 -y
sudo dpkg --configure -a


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

echo "**********************************************************************************************************************************************"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>                                                                   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>                         THANK YOU                                 <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>                                                                   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
echo "***********************************************************************************************************************************************"

echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> REBOOT YOUR MACHINE TO APPLY CHANGES <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"