#!/bin/bash


echo "Add DNS settings - ROOT"

sed -i 's/^PEERDNS=no.*/PEERDNS=yes/' /etc/sysconfig/network-scripts/ifcfg-eth1
sed -i 's/^PEERDNS=yes.*/PEERDNS=no/' /etc/sysconfig/network-scripts/ifcfg-eth0
echo "PEERDNS=no" >> etc/sysconfig/network-scripts/ifcfg-eth0

echo "DNS1=172.16.16.5" >> /etc/sysconfig/network-scripts/ifcfg-eth1
echo "DOMAIN=labor.lan" >> /etc/sysconfig/network-scripts/ifcfg-eth1

echo "EDIT /etc/hosts manual!!"