#!/bin/sh

ping -c 1 127.0.0.1

ip route del default
ip route add default via $GATEWAY

echo "nameserver $DNS" > /etc/resolv.conf
echo "search $DNS_BASE_SEARCH" >> /etc/resolv.conf

touch /.setup_correctly