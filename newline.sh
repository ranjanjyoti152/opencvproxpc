#!/bin/bash
echo "Hi There Ranjan"
echo "Starting Script"

# Update And Upgrade everything 
sudo apt update 
sudo apt upgrade -y 
sudo apt autoremove -y
sudo apt install net-tools -y
sudo apt install openssh-server -y
sudo apt install curl -y
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update -y
sudo apt install brave-browser -y

echo "Installation Of Brave Browser Completed"

echo "Installing Nvdia Drivers"
sudo add-apt-repository ppa:graphics-drivers/ppa -y
sudo apt install nvidia-driver-520 -y
sudo nvidia-smi


