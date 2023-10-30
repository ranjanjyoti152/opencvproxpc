#!/bin/bash
sudo apt update 
wget https://raw.githubusercontent.com/ranjanjyoti152/Dependencies/main/linuxclientinstall.sh
chmod +x linuxclientinstall.sh
sudo ./linuxclientinstall.sh
sudo rm linuxclientinstall.sh