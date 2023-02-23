#!/bin/#!/usr/bin/env bash

# install tools
sudo apt-get install net-tools nload -y

# check server load
grep processor /proc/cpuinfo | wc -l

# check network load
nload

# what IP addresses connected
netstat -ntu|awk '{print $5}'|cut -d: -f1 -s|sort|uniq -c|sort -nk1 -r
