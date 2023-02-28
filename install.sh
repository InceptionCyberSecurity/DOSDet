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
