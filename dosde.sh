#!/bin/bash

echo "  "
echo " Make sure you have setup your outgoing SMTP mail server as per the instructions on screen. "
echo " install.sh will install and setup a SMTP server on this local machine. "
echo " You need to specify your Gmail credentials to allow SMTP traffic."
echo " "
read -p " What email do you want the results to be sent to ? " umail

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
sed -i -e '1iIs a DOS attack Occuring Right Now?\' dos.txt
sed -i -e '1i************************************\' dos.txt

# mail
mail -s "Initial and Quick Malware Report" $umail -a dos.txt
clear
echo " Report sent to $umail. "
