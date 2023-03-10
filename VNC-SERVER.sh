#!/bin/bash

echo "INSTALLING VNC SERVER "
mkdir -p ~/.config/autostart
cp /usr/share/applications/vino-server.desktop ~/.config/autostart/.

cd /usr/lib/systemd/user/graphical-session.target.wants
sudo ln -s ../vino-server.service ./.

gsettings set org.gnome.Vino prompt-enabled false
gsettings set org.gnome.Vino require-encryption false

gsettings set org.gnome.Vino authentication-methods "['vnc']"
gsettings set org.gnome.Vino vnc-password $(echo -n 'admin@123'|base64)


echo " VNC SERVER INSTALLED "
echo " PASSWORD FOR SERVER IS (admin@123)"
echo " REBOOT YOUR MACHINE TO APPLY CHANGES "

