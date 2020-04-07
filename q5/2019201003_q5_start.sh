#!/bin/bash
sudo apt install openvpn
echo -n "Enter username: "
read u
wget --user=$u --ask-password https://vpn.iiit.ac.in/secure/ubuntu.ovpn
a="$PWD"
s="$a/ubuntu.ovpn"
#echo $s
sed -i '1s/^/nameserver 10.4.20.204 /' /etc/resolv.conf
sudo openvpn --config $s
