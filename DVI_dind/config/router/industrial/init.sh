#!/bin/sh

test -e /.started && exit 0

uci -q batch <<-EOF >/dev/null
  delete network.lan
  delete network.wan
  delete network.wan6

  # ent2ind interface
  set network.ent2ind=interface
  set network.ent2ind.proto=static
  set network.ent2ind.ifname=eth0
  set network.ent2ind.ipaddr='172.28.80.2'
  set network.ent2ind.gateway='172.28.80.1'
  set network.ent2ind.netmask='255.255.255.0'

  # industrial interface
  set network.industrial=interface
  set network.industrial.proto=static
  set network.industrial.ifname=eth1
  set network.industrial.ipaddr='172.28.90.1'
  set network.industrial.netmask='255.255.255.0'

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
  set firewall.@zone[-1].name='ent2ind'
  set firewall.@zone[-1].network='ent2ind'
  set firewall.@zone[-1].input='ACCEPT'
  set firewall.@zone[-1].output='ACCEPT'
  set firewall.@zone[-1].forward='ACCEPT'
  commit firewall.@zone[-1]

  add firewall zone
  set firewall.@zone[-1]=zone
  set firewall.@zone[-1].name='industrial'
  set firewall.@zone[-1].network='industrial'
  set firewall.@zone[-1].input='ACCEPT'
  set firewall.@zone[-1].output='ACCEPT'
  set firewall.@zone[-1].forward='ACCEPT'
  commit firewall.@zone[-1]

  # Forwarding between zones
  add firewall forwarding
  set firewall.@forwarding[-1].src='ent2ind'
  set firewall.@forwarding[-1].dest='industrial'
  add firewall forwarding
  set firewall.@forwarding[-1].src='industrial'
  set firewall.@forwarding[-1].dest='ent2ind'

  commit firewall
EOF

touch /.started

exit 0


