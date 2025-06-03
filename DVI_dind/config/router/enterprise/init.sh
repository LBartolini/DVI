#!/bin/sh

test -e /.started && exit 0

uci -q batch <<-EOF >/dev/null
  delete network.lan
  delete network.wan
  delete network.wan6

  # per2ent interface
  set network.per2ent=interface
  set network.per2ent.proto=static
  set network.per2ent.ifname=eth0
  set network.per2ent.ipaddr='172.50.0.2'
  set network.per2ent.gateway='172.50.0.1'
  set network.per2ent.netmask='255.255.255.0'

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
  set firewall.@zone[-1].name='per2ent'
  set firewall.@zone[-1].network='per2ent'
  set firewall.@zone[-1].input='ACCEPT'
  set firewall.@zone[-1].output='ACCEPT'
  set firewall.@zone[-1].forward='ACCEPT'
  commit firewall.@zone[-1]

  # Forwarding to internet
  # add firewall forwarding
  # set firewall.@forwarding[-1].src='client'
  # set firewall.@forwarding[-1].dest='internet'
  commit firewall
EOF

touch /.started

exit 0


