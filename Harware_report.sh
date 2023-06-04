#!/bin/bash

# Hardware Report
echo "Hardware Report"
echo "---------------"
echo "Processor: $(grep "model name" /proc/cpuinfo | uniq | sed -e 's/model name.*: //' -e 's/ @.*//')"
echo "RAM: $(free -h | awk '/Mem:/ {print $2}')"
echo "RAM Diagnostics:"
echo "$(sudo dmidecode --type 17 | grep Size | awk '{sum += $2} END {print "Total Installed RAM: " sum " MB"}')"
echo "$(sudo dmidecode --type 17 | grep Speed | awk '{print "Speed: " $2 " MHz"}')"
echo

echo "Motherboard: $(sudo dmidecode -s baseboard-product-name)"
echo "Motherboard Diagnostics:"
echo "$(sudo dmidecode -s baseboard-manufacturer)"
echo "$(sudo dmidecode -s baseboard-version)"
echo

echo "LAN Ports: $(lshw -class network | awk '/logical name/ {print $3}')"
echo

# Software Report
echo "Software Report"
echo "---------------"
echo "Operating System: $(lsb_release -d | awk -F"\t" '{print $2}')"
echo "Kernel Version: $(uname -r)"
echo "Installed Packages: $(dpkg --list | wc -l)"
echo

# End of Report
echo "Report generation complete."

#!/bin/bash

# Function to check hardware status
check_hardware_status() {
    echo "Hardware Status"
    echo "---------------"

    # CPU
    echo "CPU Status:"
    if grep -qi "model name" /proc/cpuinfo; then
        echo "  CPU: OK"
    else
        echo "  CPU: Not Found"
    fi

    # RAM
    echo "RAM Status:"
    if free -h | awk '/Mem:/ {print $2}' >/dev/null; then
        echo "  RAM: OK"
    else
        echo "  RAM: Not Found"
    fi

    # Storage Devices
    echo "Storage Devices Status:"
    if lsblk >/dev/null; then
        echo "  Storage Devices: OK"
    else
        echo "  Storage Devices: Not Found"
    fi

    # GPU
    echo "GPU Status:"
    if lspci | grep -i vga >/dev/null && sudo lshw -C display >/dev/null; then
        echo "  GPU: OK"
    else
        echo "  GPU: Not Found"
    fi

    # Network Interfaces
    echo "Network Interfaces Status:"
    if ip -o link show >/dev/null; then
        echo "  Network Interfaces: OK"
    else
        echo "  Network Interfaces: Not Found"
    fi

    echo
}

# Function to check software status
check_software_status() {
    echo "Software Status"
    echo "---------------"

    # Operating System
    echo "Operating System Status:"
    if lsb_release -d | awk -F"\t" '{print $2}' >/dev/null; then
        echo "  Operating System: OK"
    else
        echo "  Operating System: Not Found"
    fi

    # Kernel Version
    echo "Kernel Version Status:"
    if uname -r >/dev/null; then
        echo "  Kernel Version: OK"
    else
        echo "  Kernel Version: Not Found"
    fi

    # Installed Packages
    echo "Installed Packages Status:"
    if dpkg --list | wc -l >/dev/null; then
        echo "  Installed Packages: OK"
    else
        echo "  Installed Packages: Not Found"
    fi

    echo
}

# Check hardware status
check_hardware_status

# Check software status
check_software_status

# End of Report
echo "System status check complete."

