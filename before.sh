
echo "Installing Basic Tools For installing of Dependencies"
echo "Please Do Not Run This Multiple Times "
echo "Run It Once "
echo " Thank You "
echo "**********************************************************************************************************************************************************************"


sudo pacman -Syy
sudo pacman -Sy openvpn --noconfirm --needed
sudo pacman -Sy openssh --noconfirm --needed
sudo systemctl start sshd
sudo systemctl enable sshd
sudo pacman -Sy inetutils --noconfirm --needed
sudo pacman -Sy xfce4-settings --noconfirm --needed
sudo pacman -Sy xfce4-terminal --noconfirm --needed
sudo curl -O https://bootstrap.pypa.io/get-pip.py
python get-pip.py pip==20.3.4
sudo pacman -Sy python-pip --noconfirm --needed
sudo pacman -Sy unzip --noconfirm --needed
pip3 install opencv-python
pip3 install ffmpeg-python
sudo pacman -Sy cronie  --noconfirm --needed
sudo pacman -Sy ffmpeg --noconfirm --needed


echo "Thank You for Installing "
