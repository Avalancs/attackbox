#!/bin/bash
# make sure /dev/net/tun exists
sudo /dockerstartup/custom_startup.sh

if [ ! -f /tryhackme.ovpn ]; then
    echo "/tryhackme.ovpn file is not found, did you mount it into the container?";
    read -p "Press enter to close"
    exit 1;
fi

# start OpenVPN connection to TryHackMe
sudo openvpn /tryhackme.ovpn
read -p "Press enter to close"