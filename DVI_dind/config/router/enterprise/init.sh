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
  set network.per2ent.ipaddr='172.28.50.2'
  set network.per2ent.gateway='172.28.50.1'
  set network.per2ent.netmask='255.255.255.0'

  # enterprise interface
  set network.enterprise=interface
  set network.enterprise.proto=static
  set network.enterprise.ifname=eth1
  set network.enterprise.ipaddr='172.28.60.1'
  set network.enterprise.netmask='255.255.255.0'

  # ent2ind interface
  set network.ent2ind=interface
  set network.ent2ind.proto=static
  set network.ent2ind.ifname=eth2
  set network.ent2ind.ipaddr='172.28.80.1'
  set network.ent2ind.netmask='255.255.255.0'

  set network.loopback.ipaddr='127.0.0.1'
  set network.loopback.netmask='255.0.0.0'

  # Static routes
  # Industrial
  add network route
  set network.@route[-1].interface=ent2ind
  set network.@route[-1].target='172.28.90.0' 
  set network.@route[-1].netmask='255.255.255.0'
  set network.@route[-1].gateway='172.28.80.2'

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

  add firewall zone
  set firewall.@zone[-1]=zone
  set firewall.@zone[-1].name='enterprise'
  set firewall.@zone[-1].network='enterprise'
  set firewall.@zone[-1].input='ACCEPT'
  set firewall.@zone[-1].output='ACCEPT'
  set firewall.@zone[-1].forward='ACCEPT'
  commit firewall.@zone[-1]

  add firewall zone
  set firewall.@zone[-1]=zone
  set firewall.@zone[-1].name='ent2ind'
  set firewall.@zone[-1].network='ent2ind'
  set firewall.@zone[-1].input='ACCEPT'
  set firewall.@zone[-1].output='ACCEPT'
  set firewall.@zone[-1].forward='ACCEPT'
  commit firewall.@zone[-1]

  # Forwarding between zones
  add firewall forwarding
  set firewall.@forwarding[-1].src='per2ent'
  set firewall.@forwarding[-1].dest='enterprise'
  add firewall forwarding
  set firewall.@forwarding[-1].src='enterprise'
  set firewall.@forwarding[-1].dest='per2ent'

  add firewall forwarding
  set firewall.@forwarding[-1].src='ent2ind'
  set firewall.@forwarding[-1].dest='enterprise'
  add firewall forwarding
  set firewall.@forwarding[-1].src='enterprise'
  set firewall.@forwarding[-1].dest='ent2ind'

  add firewall forwarding
  set firewall.@forwarding[-1].src='ent2ind'
  set firewall.@forwarding[-1].dest='per2ent'
  add firewall forwarding
  set firewall.@forwarding[-1].src='per2ent'
  set firewall.@forwarding[-1].dest='ent2ind'

  commit firewall
EOF

touch /.started

exit 0


