
username=$USER
read -p "Enter Machine Password again please: " password 
cd

# # Log file
# exec 3>&1 4>&2
# trap 'exec 2>&4 1>&3' 0 1 2 3
# exec 1>iris_installation_log.out 2>&1
# set +e

echo $password | sudo -kS sed -i '5 i 3.109.91.77 iwizregistry.iwizardsolutions.com' /etc/hosts

# Purge Existing Dependencies
echo $password | sudo -kS apt -y remove --purge "^libcuda.*"
echo $password | sudo -kS apt -y remove --purge "^cuda.*"
echo $password | sudo -kS apt -y remove --purge "^libnvidia.*"
echo $password | sudo -kS apt -y remove --purge "^nvidia.*"
echo $password | sudo -kS apt -y remove --purge "^tensorrt.*" 

# Purge Existing Dependencies
echo $password | sudo -kS apt-get -y --purge remove "*cublas*" "cuda*" "nsight*" 
echo $password | sudo -kS apt-get -y --purge remove "*nvidia*"
echo $password | sudo -kS apt remove -y --autoremove nvidia-cuda-toolkit

# Install CUDA-11-6
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
echo $password | sudo -kS mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
cd ~
if [ -f "$(ls cuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb)" ]; then
echo -e "\ncuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb present\n"
else
wget https://developer.download.nvidia.com/compute/cuda/11.6.0/local_installers/cuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb
fi
echo $password | sudo -kS dpkg -i cuda-repo-ubuntu2004-11-6-local_11.6.0-510.39.01-1_amd64.deb
echo $password | sudo -kS apt-key add /var/cuda-repo-ubuntu2004-11-6-local/7fa2af80.pub
echo $password | sudo -kS apt-get update
echo $password | sudo -kS apt-get -y install cuda-11-6

# Install CUDA-11-5
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
echo $password | sudo -kS mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
cd ~
if [ -f "$(ls cuda-repo-ubuntu2004-11-5-local_11.5.2-495.29.05-1_amd64.deb)" ]; then
echo -e "\ncuda-repo-ubuntu2004-11-5-local_11.5.2-495.29.05-1_amd64.deb present\n"
else
wget https://developer.download.nvidia.com/compute/cuda/11.5.2/local_installers/cuda-repo-ubuntu2004-11-5-local_11.5.2-495.29.05-1_amd64.deb
fi
echo $password | sudo -kS dpkg -i cuda-repo-ubuntu2004-11-5-local_11.5.2-495.29.05-1_amd64.deb
echo $password | sudo -kS apt-key add /var/cuda-repo-ubuntu2004-11-5-local/7fa2af80.pub
echo $password | sudo -kS apt-get update
echo $password | sudo -kS apt-get -y install cuda-11-5

# Install CUDA-11-4
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
echo $password | sudo -kS mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
cd ~
if [ -f "$(ls cuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb)" ]; then
echo -e "\ncuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb present\n"
else
wget https://developer.download.nvidia.com/compute/cuda/11.4.1/local_installers/cuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb
fi
echo $password | sudo -kS dpkg -i cuda-repo-ubuntu2004-11-4-local_11.4.1-470.57.02-1_amd64.deb
echo $password | sudo -kS apt-key add /var/cuda-repo-ubuntu2004-11-4-local/7fa2af80.pub
echo $password | sudo -kS apt-get update
echo $password | sudo -kS apt-get -y install cuda-11-4

# Install CUDA-11-2
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
echo $password | sudo -kS mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
cd ~
if [ -f "$(ls cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb)" ]; then
echo -e "\ncuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb present\n"
else
wget https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb
fi
echo $password | sudo -kS dpkg -i cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb
echo $password | sudo -kS apt-key add /var/cuda-repo-ubuntu2004-11-2-local/7fa2af80.pub
echo $password | sudo -kS apt-get update
echo $password | sudo -kS apt-get -y install cuda-11-2


echo $password | sudo -kS apt --fix-broken -y install 
echo $password | sudo -kS dpkg --force-all -i /var/cuda-repo-ubuntu2004-11-2-local/./cuda-cudart-11-2_11.2.152-1_amd64.deb

# Install CUDA-11-1
wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
echo $password | sudo -kS mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
cd ~
if [ -f "$(ls cuda-repo-ubuntu2004-11-1-local_11.1.1-455.32.00-1_amd64.deb)" ]; then
echo -e "\ncuda-repo-ubuntu2004-11-1-local_11.1.1-455.32.00-1_amd64.deb present\n"
else
wget https://developer.download.nvidia.com/compute/cuda/11.1.1/local_installers/cuda-repo-ubuntu2004-11-1-local_11.1.1-455.32.00-1_amd64.deb
fi
echo $password | sudo -kS dpkg -i cuda-repo-ubuntu2004-11-1-local_11.1.1-455.32.00-1_amd64.deb
echo $password | sudo -kS apt-key add /var/cuda-repo-ubuntu2004-11-1-local/7fa2af80.pub
echo $password | sudo -kS apt-get update
echo $password | sudo -kS apt-get -y install cuda-11-1

# Install Tensorrt 7.2.2
cd ~
if [ -f "$(ls nv-tensorrt-repo-ubuntu1804-cuda11.1-trt7.2.2.3-ga-20201211_1-1_amd64.deb)" ]; then
echo -e "\nnv-tensorrt-repo-ubuntu1804-cuda11.1-trt7.2.2.3-ga-20201211_1-1_amd64.deb present\n"
else
wget https://irisretailstoragebox.blob.core.windows.net/irismodels/nv-tensorrt-repo-ubuntu1804-cuda11.1-trt7.2.2.3-ga-20201211_1-1_amd64.deb
fi
echo $password | sudo -kS dpkg -i nv-tensorrt-repo-ubuntu1804-cuda11.1-trt7.2.2.3-ga-20201211_1-1_amd64.deb
echo $password | sudo -kS apt -y update
echo $password | sudo -kS apt install -y tensorrt
echo $password | sudo -kS apt -y --fix-broken install
echo $password | sudo -kS ldconfig
sleep 5 


# Install Docker
cd
echo $password | sudo -kS apt-get -y remove docker docker-engine docker.io containerd runc
echo $password | sudo -kS apt-get -y update
echo $password | sudo -kS apt install -y curl tmux vim openssh-server
echo $password | sudo -kS apt install python3-pip
pip3 install paho-mqtt && echo $password | sudo -kS apt install -y mosquitto mosquitto-clients
echo $password | sudo -kS apt-get install -y \
apt-transport-https \
ca-certificates \
curl \
gnupg-agent \
software-properties-common 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo $password | sudo -kS apt-key fingerprint 0EBFCD8
echo $password | sudo -kS add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo $password | sudo -kS apt-get -y update
echo $password | sudo -kS apt-get install -y docker-ce docker-ce-cli containerd.io
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
echo $password | sudo -kS apt-get -y update && echo $password | sudo -kS apt-get install -y nvidia-container-toolkit
echo $password | sudo -kS systemctl restart docker
echo $password | sudo -kS apt-get install -y nvidia-container-runtime
echo $password | sudo -kS apt install -y libsqlite3-dev
echo $password | sudo -kS mkdir -p /etc/systemd/system/docker.service.d
echo $password | sudo -kS systemctl daemon-reload && echo $password | sudo -kS systemctl restart docker
cd
echo $password | sudo -kS apt -y update && echo $password | sudo -kS apt -y upgrade
echo $password | sudo -kS apt -y install curl
curl -sSL https://get.docker.com/ | sh
sudo tee /etc/docker/daemon.json <<EOF
    {
            "default-runtime" : "nvidia",
         "runtimes": {
                  "nvidia": {
                    "path": "nvidia-container-runtime",
                  "runtimeArgs": []
              }
     },
            "insecure-registries" : ["iwizregistry.iwizardsolutions.com:5000"]
    }
EOF
echo $password | sudo -kS systemctl daemon-reload && echo $password | sudo -kS systemctl restart docker

# Install Resolv Conf
echo $password | sudo -kS apt -y install resolvconf
sudo tee /etc/resolvconf/resolv.conf.d/head <<EOF 
nameserver 8.8.8.8 
nameserver 8.8.8.4 
EOF
sudo resolvconf --enable-updates
sudo resolvconf -u
cd

# Install Boost
cd
echo $password | sudo -kS apt install -y libboost-all-dev


# Install DS and its Dependencies
echo $password | sudo -kS apt -y install libjson-glib-dev
echo $password | sudo -kS apt -y install libcrypto++-dev libcrypto++-doc libcrypto++-utils openssh-server
echo $password | sudo -kS apt -y install libgstrtspserver-1.0-dev uuid uuid-dev libconfig++-dev libboost-all-dev libopencv-dev libcurl4-gnutls-dev gnutls-dev libsqlite3-dev glances git-lfs gdm3 vino nload net-tools 
echo $password | sudo -kS apt -y install gcc-7 g++-7
echo $password | sudo -kS update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 7
echo $password | sudo -kS update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 7
cd ~
if [ -f "$(ls deepstream-5.1_5.1.0-1_amd64.deb)" ]; then
echo "deepstream-5.1_5.1.0-1_amd64.deb file present"
else
wget https://irisretailstoragebox.blob.core.windows.net/irismodels/deepstream-5.1_5.1.0-1_amd64.deb
fi
echo $password | sudo -kS dpkg -i deepstream-5.1_5.1.0-1_amd64.deb
echo $password | sudo -kS apt -y --fix-broken install
echo $password | sudo -kS apt -y install libgstrtspserver-1.0-dev ffmpeg
echo $password | sudo -kS apt -y install build-essential gcc make cmake cmake-gui cmake-curses-gui libssl-dev doxygen graphviz libcppunit-dev

# Install MQTT 
cd ~
git clone https://github.com/eclipse/paho.mqtt.c.git
cd paho.mqtt.c
git checkout v1.3.7
cmake -Bbuild -H. -DPAHO_WITH_SSL=ON -DPAHO_ENABLE_TESTING=OFF
echo $password | sudo -kS cmake --build build/ --target install
echo $password | sudo -kS ldconfig
cd ~
git clone https://github.com/eclipse/paho.mqtt.cpp
cd paho.mqtt.cpp
cmake -Bbuild -H. -DPAHO_BUILD_DOCUMENTATION=TRUE -DPAHO_BUILD_SAMPLES=TRUE
echo $password | sudo -kS cmake --build build/ --target install
echo $password | sudo -kS ldconfig
cd

# Log file

cd /etc/openvpn
sudo sed -i '5,6 s/#/ /' update-resolv-conf
sudo sed -i '5 i script-security 2' update-resolv-conf
cd

# Make LAN Driver Persistent
cd ~/Downloads
wget https://irisretailstoragebox.blob.core.windows.net/irismodels/r8125-9.004.01.tar.bz2
echo $password | sudo -kS chmod 0777 *
tar -xvf r8125-9.004.01.tar.bz2
cd r8125-9.004.01/
echo $password | sudo -kS ./autorun.sh
sudo tee /etc/modules-load.d/r8125.conf << EOF
r8125
EOF
sudo tee /etc/modules-load.d/r8169.conf << EOF
r8169
EOF
echo $password | sudo -kS modprobe r8169
echo $password | sudo -kS modprobe r8125

# Disable Auto Update
echo $password | sudo -kS chmod -x /etc/update-motd.d/91-release-upgrade
sudo tee /etc/apt/apt.conf.d/20auto-upgrades <<EOF
APT::Periodic::Unattended-Upgrade "0";
EOF

# Enable Auto Login
sudo sed -i 's/#  AutomaticLoginEnable = true/AutomaticLoginEnable = true/g' /etc/gdm3/custom.conf
sudo sed -i 's/#  AutomaticLogin = user1/AutomaticLogin = '${username}'/g' /etc/gdm3/custom.conf
sudo sed -i 's/#WaylandEnable=false/WaylandEnable=false/g' /etc/gdm3/custom.conf

# Enable Docker API
echo $password | sudo -kS mkdir /etc/systemd/system/docker.service.d/
sudo tee /etc/systemd/system/docker.service.d/override.conf <<EOF
[Service]
ExecStart=
ExecStart=/usr/bin/dockerd --host=fd:// --add-runtime=nvidia=/usr/bin/nvidia-container-runtime -H fd:// -H tcp://0.0.0.0:2375
EOF

echo $password | sudo -kS apt install -y libopencv-dev

echo $password | sudo -kS apt install -y openssh-server gunicorn


cd ~ && wget https://irisretailstoragebox.blob.core.windows.net/irismodelss/yolo_engine_path.patch

cd ~ && wget https://irisretailstoragebox.blob.core.windows.net/irismodelss/build.patch

cd ~ && wget https://irisretailstoragebox.blob.core.windows.net/irismodelss/libnvinfer_plugin.so.7.2.2

echo $password | sudo -kS patch -R /opt/nvidia/deepstream/deepstream/sources/libs/nvdsinfer/nvdsinfer_model_builder.cpp yolo_engine_path.patch

echo $password | sudo -kS patch -R /opt/nvidia/deepstream/deepstream/sources/libs/nvdsinfer/Makefile build.patch

cd /opt/nvidia/deepstream/deepstream/sources/libs/nvdsinfer

echo $password | sudo -kS make install -j$(nproc) CUDA_VER=11.1

cd 

sudo ldconfig


cd ~ && echo $password | sudo -kS cp libnvinfer_plugin.so.7.2.2 /usr/lib/x86_64-linux-gnu/libnvinfer_plugin.so.7.2.2

sudo ldconfig

# CUDA
# sudo tee -a ~/.bashrc <<EOF
# export CUDA=11.4
# export PATH=/usr/local/cuda-$CUDA/bin${PATH:+:${PATH}}
# export CUDA_PATH=/usr/local/cuda-$CUDA
# export CUDA_HOME=/usr/local/cuda-$CUDA
# export LIBRARY_PATH=$CUDA_HOME/lib64:$LIBRARY_PATH
# export LD_LIBRARY_PATH=/usr/local/cuda-$CUDA/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
# export LD_LIBRARY_PATH=/usr/local/cuda/extras/CUPTI/lib64:$LD_LIBRARY_PATH
# export NVCC=/usr/local/cuda-$CUDA/bin/nvcc
# export CFLAGS="-I$CUDA_HOME/include $CFLAGS"
# EOF

#source /home/$USER/.bashrc

echo $password | sudo -kS docker pull iwizregistry.iwizardsolutions.com:5000/iris_dgpu_3xxx_base_image:v4.0

# Details to Log
ifconfig
cat /etc/hosts
printf '\nFinished!\n'
printf '\nRebboting the machine in 60 secs\n'
sleep 5
# echo $password | sudo -kS systemctl restart anydesk.service
sleep 60
echo $password | sudo -kS reboot
