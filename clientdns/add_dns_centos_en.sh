#!/bin/bash

#only root

ID=$(id -u)

if [ "$ID" -ne 0 ]; then
        echo "Runs as root or sudo"
        echo "$ID"
        exit 1
else
        echo "OK"
        echo "$ID"
fi


echo "Add DNS settings - ROOT"

sed -i 's/^PEERDNS=no.*/PEERDNS=yes/' /etc/sysconfig/network-scripts/ifcfg-enp0s8
sed -i 's/^PEERDNS=yes.*/PEERDNS=no/' /etc/sysconfig/network-scripts/ifcfg-enp0s3
echo "PEERDNS=no" >> etc/sysconfig/network-scripts/ifcfg-enp0s3

echo "DNS1=172.16.16.5" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8
echo "DOMAIN=labor.lan" >> /etc/sysconfig/network-scripts/ifcfg-enp0s8

echo "EDIT /etc/hosts manual!!"