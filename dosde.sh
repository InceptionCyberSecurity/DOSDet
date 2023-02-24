#!/bin/bash

# Install tools
sudo apt update
sudo apt-get install net-tools nload mailutils ssmtp epel-release -y
# nano /etc/ssmtp/ssmtp.conf
# change email addresses to your Gmail account

echo " "
echo " Make sure you have setup your outgoing SMTP mail server as per the instructions on screen. "
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
sed -i -e '1iDOS attack Occuring\' dos.txt
sed -i -e '1i******************************************************************\' dos.txt

# mail
mail -s "Malware Report" $umail -a dos.txt
clear
echo " Report sent to $umail. "
