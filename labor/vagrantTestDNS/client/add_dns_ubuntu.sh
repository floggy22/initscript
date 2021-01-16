#!/bin/bash

echo "Add DNS settings - ROOT"

sudo cat /etc/netplan/50-vagrant.yaml /vagrant/client/netplan.yaml >> 60.myconfig.yaml
sudo rm /etc/netplan/50-vagrant.yaml
sudo netplan apply

echo "EDIT /etc/hosts manual!!"