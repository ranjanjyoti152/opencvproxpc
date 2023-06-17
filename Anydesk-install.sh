#!/bin/bash

read -p "ENTER YOUR MACHINES PASSWORD "

echo " CLEANING PREVIOUS INSTALLATION "

sudo apt purge anydesk -y 
sudo apt autoclean 
sudo apt autoremove -y 

echo " INSTALLING ANYDESK "
wget https://github.com/ranjanjyoti152/nvme/raw/main/anydesk_6.2.1-1_amd64.deb

sudo apt update -y 

sudo dpkg -i anydesk_6.2.1-1_amd64.deb

sudo apt --fix-broken install -y 
sudo rm anydesk_6.2.1-1_amd64.deb
echo " DISPLAY ANYDESK ID " 
sudo anydesk --get-id 
sudo anydesk --get-id 
sudo anydesk --get-id 
sudo anydesk --get-id 
sudo anydesk --get-id 
echo " ANYDESK PASSWORD IS SET TO  ( prox@123 ) "
echo prox@123 | sudo anydesk --set-password 

echo " INSTALLATION IS COMPLETE " 

