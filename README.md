# DOSDet
 Quick DOS detection for Linux Server. Makes a snapshot so the Report will be indicative, and so aid your early Incident Response. <br/>
 Use cron to run dosde.h regularly. <br/>

# Mitigate a DOS attack
From dosde.sh, identify the IPs attacking you. Block using <br/>

**route add "ipaddress" reject** <br/>
**route -n |grep "ipaddress"  to check if blocked** <br/>

Also you can block an IP address using iptables

**iptables -A INPUT 1 -s IPADDRESS -j DROP/REJECT** <br/>
**service iptables restart** <br/>
**service iptables save** <br/>

Now kill all httpd connections and restart httpd services

**killall -KILL httpd** <br/>
**service httpd startssl** <br/>

Repeat for all malicious IPs.

# TODO
.txt file Report as HTML

# License
MIT License
Copyright (c) ArcadeusOPS

# Bugs
Send issues to info@arcadeusops.com stating nature of issue. A screenshot will help too. Thanks.

# CPD
Part of EC-Council ECE/CPD Credits
