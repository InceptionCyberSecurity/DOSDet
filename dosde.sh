#!/bin/bash

echo "  "
echo " Make sure you have setup your outgoing SMTP mail server as per the instructions on screen. "
echo " install.sh will install and setup a SMTP server on this local machine. "
echo " You need to specify your Gmail credentials to allow SMTP traffic."
echo " "
echo " RUN FIRST TO GET IP ADDRESS - netstat -ntu|awk '{print $5}'|cut -d: -f1 -s|sort|uniq -c|sort -nk1 -r > netst.txt "
echo " "
read -p " What email do you want the results to be sent to ? " umail
read -p " What IP address would you like blocked? Enter 0.0.0.0 if no IP address known " ipban

# Check server load. If number is high, investigate.
grep processor /proc/cpuinfo | wc -l > load.txt
sed -i -e '1iServer Load\' load.txt
sed -i -e '2i*************************\' load.txt
# Check network load. See a fairly normal incoming and outgoing network load?
nload > nload.txt
sed -i -e '1iNetwork Load\' nload.txt
sed -i -e '2i*************************\' nload.txt
# What IP addresses connected? IP address with a large number of instances over 100?
netstat -ntu|awk '{print $5}'|cut -d: -f1 -s|sort|uniq -c|sort -nk1 -r > netst.txt
sed -i -e '1iConnected IPs\' netst.txt
sed -i -e '2i*************************\' netst.txt
# process txt files
cat load.txt nload.txt netst.txt | sort > dos.txt
sed -i -e '1iIs a DOS attack happening right now?\' dos.txt
sed -i -e '2i*********************************************************\' dos.txt

# ban attacking IP
route add $ipban reject
route -n |grep $ipban
# kill process using IPTABLES
iptables -A INPUT 1 -s $ipban -j DROP/REJECT
service iptables restart
service iptables save
# Now kill all httpd connections and restart httpd services
killall -KILL httpd
service httpd startssl

# mail
mail -s "Initial and Quick Malware Report" $umail -a dos.txt
clear
echo " Report sent to $umail. "
