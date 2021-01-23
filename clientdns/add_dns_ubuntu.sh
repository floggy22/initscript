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

SPATH=`dirname "$0"`

echo "Add DNS settings - ROOT"
sudo cat /etc/netplan/50-vagrant.yaml $SPATH/netplan.yaml >> /etc/netplan/10-myconfig.yaml
sudo rm /etc/netplan/50-vagrant.yaml
sudo netplan -debug apply

echo "EDIT /etc/hosts manual!!"