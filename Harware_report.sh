#!/bin/bash

# Hardware Report
echo "Hardware Report"
echo "---------------"
echo "Processor: $(grep "model name" /proc/cpuinfo | uniq | sed -e 's/model name.*: //' -e 's/ @.*//')"
echo "RAM: $(free -h | awk '/Mem:/ {print $2}')"
echo "Disk Space: $(df -h / | awk '/\// {print $2 " total, " $3 " used, " $4 " available"}')"
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
