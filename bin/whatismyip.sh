#!/bin/bash

# get IP address


if [ $(uname | grep -i "cygwin") ]; then # for Cygwin
    ipconfig |grep -a 'IPv4' | cut -d: -f2 | awk '{ print $1}'
elif [ $(/sbin/ifconfig |grep -i "eth0") ]; then # for Linux openSUSE (eth0) 
    /sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'
elif [ !$(/sbin/ifconfig | grep -qi "eno1") ]; then # for Linux CentOS (eno1)
    /sbin/ifconfig eno1 | grep 'inet '  | awk '{ print $2}'
else # for unknown interface
    echo "unknown interface"
fi



