#!/bin/bash

# Utilize the built-in command /usr/bin/desktop_ready to ensure applications start after the Kasm desktop environment.
/usr/bin/desktop_ready

# create tun device
if [ ! -c /dev/net/tun ]; then
  mkdir -p /dev/net
  mknod /dev/net/tun c 10 200
fi

# Enable devices MASQUERADE mode
iptables -t nat -A POSTROUTING -o tun+ -j MASQUERADE