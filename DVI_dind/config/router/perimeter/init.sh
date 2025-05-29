#!/bin/sh

test -e /.started && exit 0

uci -q batch <<-EOF >/dev/null
  delete network.lan
  delete network.wan
  delete network.wan6

  # internet interface
  set network.internet=interface
  set network.internet.proto=static
  set network.internet.ifname=eth0
  set network.internet.ipaddr='172.30.0.2'
  set network.internet.gateway='172.30.0.1'
  set network.internet.netmask='255.255.255.0'

  # client interface
  set network.client=interface
  set network.client.proto=static
  set network.client.ifname=eth1
  set network.client.ipaddr='172.29.0.1'
  set network.client.netmask='255.255.255.0'

  # dmz interface
  set network.dmz=interface
  set network.dmz.proto=static
  set network.dmz.ifname=eth2
  set network.dmz.ipaddr='172.28.0.1'
  set network.dmz.netmask='255.255.255.0'

  set network.loopback.ipaddr='127.0.0.1'
  set network.loopback.netmask='255.0.0.0'

  commit network

  set uhttpd.main.rfc1918_filter=0
  commit uhttpd
EOF

# remove old wan/lan rules (add this part if you require removing default zones and rules)
n=$(uci show firewall | egrep "wan|lan" | wc -l)
for i in $(seq 1 $n)
do
 uci delete $(uci show firewall | egrep "wan|lan" | head -1 | cut -d. -f1,2)
done 

uci commit

uci -q batch <<-EOF >/dev/null
  add firewall zone   
  set firewall.@zone[-1]=zone
  set firewall.@zone[-1].name='internet'
  set firewall.@zone[-1].network='internet'
  set firewall.@zone[-1].input='ACCEPT'
  set firewall.@zone[-1].output='ACCEPT'
  set firewall.@zone[-1].forward='ACCEPT'
  set firewall.@zone[-1].masq='1'
  commit firewall.@zone[-1]

  add firewall zone
  set firewall.@zone[-1]=zone
  set firewall.@zone[-1].name='client'
  set firewall.@zone[-1].network='client'
  set firewall.@zone[-1].input='ACCEPT'
  set firewall.@zone[-1].output='ACCEPT'
  set firewall.@zone[-1].forward='ACCEPT'
  commit firewall.@zone[-1]

  add firewall zone
  set firewall.@zone[-1]=zone
  set firewall.@zone[-1].name='dmz'
  set firewall.@zone[-1].network='dmz'
  set firewall.@zone[-1].input='ACCEPT'
  set firewall.@zone[-1].output='ACCEPT'
  set firewall.@zone[-1].forward='ACCEPT'
  commit firewall.@zone[-1]

  # Forwarding to internet
  add firewall forwarding
  set firewall.@forwarding[-1].src='client'
  set firewall.@forwarding[-1].dest='internet'
  add firewall forwarding
  set firewall.@forwarding[-1].src='dmz'
  set firewall.@forwarding[-1].dest='internet'

  # Forwarding between zones
  add firewall forwarding
  set firewall.@forwarding[-1].src='client'
  set firewall.@forwarding[-1].dest='dmz'
  add firewall forwarding
  set firewall.@forwarding[-1].src='dmz'
  set firewall.@forwarding[-1].dest='client'  

  # Port forwarding to DVWA
  add firewall redirect
  set firewall.@redirect[-1].target='DNAT'
  set firewall.@redirect[-1].name='DVWA'
  set firewall.@redirect[-1].src='internet'
  set firewall.@redirect[-1].src_dport='5000'
  set firewall.@redirect[-1].dest_ip='172.28.0.2'
  set firewall.@redirect[-1].dest_port='80'

  commit firewall
EOF

touch /.started

exit 0


