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
