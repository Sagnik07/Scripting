#!/bin/bash
sed -i 's/nameserver 10.4.20.204 //g' /etc/resolv.conf
a="$PWD"
s="$a/ubuntu.ovpn"
sudo rm -rf $s
