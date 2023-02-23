#!/bin/#!/usr/bin/env bash

# Install tools
sudo apt-get install net-tools nload -y

# Check server load. If number is high, investigate.
grep processor /proc/cpuinfo | wc -l

# Check network load. See a fairly normal incoming and outgoing network load?
nload

# What IP addresses connected? IP address with a large number of instances over 100?
netstat -ntu|awk '{print $5}'|cut -d: -f1 -s|sort|uniq -c|sort -nk1 -r
