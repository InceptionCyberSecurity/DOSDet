# DOSDet
 Quick DOS detection for Linux Server. Makes a snapshot so the Report will be indicative, and so aid your early Incident Response.

# Mitigate a DOS attack
From dosde.sh, identify the IPs attacking you. Block using <br/>

**route add "ipaddress" reject** <br/>
**route -n |grep "ipaddress"  to check if blocked**<br/>

Also you can block an IP address using iptables

iptables -A INPUT 1 -s IPADDRESS -j DROP/REJECT
service iptables restart
service iptables save

Now kill all httpd connections and restart httpd services

killall -KILL httpd
service httpd startssl

Repeat for all malicious IPs.

# TODO
Send Report to user defined email

# License
MIT License
Copyright (c) ArcadeusOPS

# Bugs
Send issues to info@arcadeusops.com stating nature of issue. A screenshot will help too. Thanks.
