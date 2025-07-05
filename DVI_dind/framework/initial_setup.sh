#!/bin/sh

ping -c 1 127.0.0.1 || exit
ip route || exit

ip route del default
ip route add default via $GATEWAY

echo "nameserver $DNS" > /etc/resolv.conf
echo "nameserver 8.8.8.8" >> /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo "search $DNS_BASE_SEARCH" >> /etc/resolv.conf

touch /.setup_correctly