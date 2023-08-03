#!/bin/bash
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install nano
sudo apt-get install dphys-swapfile -y
sudo nano /sbin/dphys-swapfile
free -m
wget https://github.com/Qengineering/Install-OpenCV-Jetson-Nano/raw/main/OpenCV-4-8-0.sh
sudo chmod 755 ./OpenCV-4-8-0.sh
./OpenCV-4-8-0.sh
rm OpenCV-4-8-0.sh
sudo /etc/init.d/dphys-swapfile stop
sudo apt-get remove --purge dphys-swapfile
sudo rm -rf ~/opencv
sudo rm -rf ~/opencv_contrib