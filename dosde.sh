#!/bin/bash

# Install tools
sudo apt-get install net-tools nload -y

# Check server load. If number is high, investigate.
grep processor /proc/cpuinfo | wc -l > load.txt
sed -i -e '1iServer Load\' load.txt

# Check network load. See a fairly normal incoming and outgoing network load?
nload > nload.txt
sed -i -e '1iNetwork Load\' nload.txt

# What IP addresses connected? IP address with a large number of instances over 100?
netstat -ntu|awk '{print $5}'|cut -d: -f1 -s|sort|uniq -c|sort -nk1 -r > netst.txt
sed -i -e '1iConnected IPs\' netst.txt

# process txt files
cat load.txt nload.txt netst.txt | sort > dos.txt
sed -i -e '1iDOS attack Occuring\' dos.txt
sed -i -e '1i******************************************************************\' dos.txt
