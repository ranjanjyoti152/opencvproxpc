#!/bin/bash

# Python script
python_script=$(cat <<'PYTHON_SCRIPT'
import subprocess

# Function to check CPU status
def check_cpu_status():
    try:
        subprocess.run("grep -qi 'model name' /proc/cpuinfo", shell=True, check=True)
        print("CPU: OK")
    except subprocess.CalledProcessError:
        print("CPU: Not Found")

# Function to check RAM status
def check_ram_status():
    try:
        subprocess.run("free -h | awk '/Mem:/ {print $2}'", shell=True, check=True)
        print("RAM: OK")
    except subprocess.CalledProcessError:
        print("RAM: Not Found")

# Function to check storage devices status
def check_storage_status():
    try:
        subprocess.run("lsblk", shell=True, check=True)
        print("Storage Devices: OK")
    except subprocess.CalledProcessError:
        print("Storage Devices: Not Found")

# Function to check GPU status
def check_gpu_status():
    try:
        subprocess.run("lspci | grep -i vga", shell=True, check=True)
        subprocess.run("sudo lshw -C display", shell=True, check=True)
        print("GPU: OK")
    except subprocess.CalledProcessError:
        print("GPU: Not Found")

# Function to check network interfaces status
def check_network_status():
    try:
        subprocess.run("ip -o link show", shell=True, check=True)
        print("Network Interfaces: OK")
    except subprocess.CalledProcessError:
        print("Network Interfaces: Not Found")

# Function to check operating system status
def check_os_status():
    try:
        subprocess.run("lsb_release -d", shell=True, check=True)
        print("Operating System: OK")
    except subprocess.CalledProcessError:
        print("Operating System: Not Found")

# Function to check kernel version status
def check_kernel_status():
    try:
        subprocess.run("uname -r", shell=True, check=True)
        print("Kernel Version: OK")
    except subprocess.CalledProcessError:
        print("Kernel Version: Not Found")

# Function to check installed packages status
def check_packages_status():
    try:
        subprocess.run("dpkg --list | wc -l", shell=True, check=True)
        print("Installed Packages: OK")
    except subprocess.CalledProcessError:
        print("Installed Packages: Not Found")


# Check hardware status
print("Hardware Status")
print("---------------")
check_cpu_status()
check_ram_status()
check_storage_status()
check_gpu_status()
check_network_status()

print()

# Check software status
print("Software Status")
print("---------------")
check_os_status()
check_kernel_status()
check_packages_status()
PYTHON_SCRIPT
)

# C++ script
cpp_script=$(cat <<'CPP_SCRIPT'
#include <iostream>
#include <cstdlib>

int main() {
    std::cout << "Hardware Status" << std::endl;
    std::cout << "---------------" << std::endl;

    // CPU
    std::cout << "CPU: ";
    if (system("grep -qi 'model name' /proc/cpuinfo") == 0) {
        std::cout << "OK" << std::endl;
    } else {
        std::cout << "Not Found" << std::endl;
    }

    // RAM
    std::cout << "RAM: ";
    if (system("free -h | awk '/Mem:/ {print $2}'") == 0) {
        std::cout << "OK" << std::endl;
    } else {
        std::cout << "Not Found" << std::endl;
    }

    // Storage Devices
    std::cout << "Storage Devices: ";
    if (system("lsblk") == 0) {
        std::cout << "OK" << std::endl;
    } else {
        std::cout << "Not Found" << std::endl;
    }

    // GPU
    std::cout << "GPU: ";
    if (system("lspci | grep -i vga && sudo lshw -C display") == 0) {
        std::cout << "OK" << std::endl;
    } else {
        std::cout << "Not Found" << std::endl;
    }

    // Network Interfaces
    std::cout << "Network Interfaces: ";
    if (system("ip -o link show") == 0) {
        std::cout << "OK" << std::endl;
    } else {
        std::cout << "Not Found" << std::endl;
    }

    std::cout << std::endl;

    std::cout << "Software Status" << std::endl;
    std::cout << "---------------" << std::endl;

    // Operating System
    std::cout << "Operating System: ";
    if (system("lsb_release -d") == 0) {
        std::cout << "OK" << std::endl;
    } else {
        std::cout << "Not Found" << std::endl;
    }

    // Kernel Version
    std::cout << "Kernel Version: ";
    if (system("uname -r") == 0) {
        std::cout << "OK" << std::endl;
    } else {
        std::cout << "Not Found" << std::endl;
    }

    // Installed Packages
    std::cout << "Installed Packages: ";
    if (system("dpkg --list | wc -l") == 0) {
        std::cout << "OK" << std::endl;
    } else {
        std::cout << "Not Found" << std::endl;
    }

    return 0;
}
CPP_SCRIPT
)

# Save Python script to a file
echo "$python_script" > system_status.py

# Save C++ script to a file
echo "$cpp_script" > system_status.cpp

# Make the C++ script executable
chmod +x system_status.cpp

# Run the scripts
echo "Running Python script..."
python3 system_status.py

echo

echo "Running C++ script..."
./system_status.cpp

echo

echo "Running Shell commands..."
echo "Hardware Status"
echo "---------------"
grep -qi 'model name' /proc/cpuinfo && echo "CPU: OK" || echo "CPU: Not Found"
free -h | awk '/Mem:/ {print $2}' && echo "RAM: OK" || echo "RAM: Not Found"
lsblk && echo "Storage Devices: OK" || echo "Storage Devices: Not Found"
lspci | grep -i vga && sudo lshw -C display && echo "GPU: OK" || echo "GPU: Not Found"
ip -o link show && echo "Network Interfaces: OK" || echo "Network Interfaces: Not Found"

echo

echo "Software Status"
echo "---------------"
lsb_release -d && echo "Operating System: OK" || echo "Operating System: Not Found"
uname -r && echo "Kernel Version: OK" || echo "Kernel Version: Not Found"
dpkg --list | wc -l && echo "Installed Packages: OK" || echo "Installed Packages: Not Found"

# Cleanup
rm system_status.py
rm system_status.cpp
