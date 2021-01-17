#!/bin/bash


SPATH=`dirname "$0"`

echo "Add DNS settings - ROOT"

sudo cat /etc/netplan/50-vagrant.yaml $SPATH/netplan.yaml >> /etc/netplan/60-myconfig.yaml
sudo rm /etc/netplan/50-vagrant.yaml
sudo netplan apply

echo "EDIT /etc/hosts manual!!"