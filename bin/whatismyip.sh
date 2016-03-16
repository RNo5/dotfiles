#!/bin/bash

# get IP address


if [ $(uname | grep -i "cygwin") ]; then # for Cygwin
    ipconfig |grep -a 'IPv4' | cut -d: -f2 | awk '{ print $1}'
else # for Linux
    /sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'
fi



