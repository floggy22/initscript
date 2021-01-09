#!/bin/bash
sudo apt update
sudo apt install -y nfs-kernel-server

sudo mkdir -p /var/nfs/general
sudo chown nobody:nogroup /var/nfs/general
sudo chmod g+w a+w /var/nfs/general

sudo mkdir -p /var/nfs/new
sudo chown nobody:nogroup /var/nfs/new
sudo chmod g+w a+w /var/nfs/new

sudo echo "/var/nfs/general  172.16.16.0/24:(rw,nohide,insecure,sync,no_subtree_check)" >> /etc/exports
sudo echo "/var/nfs/new  172.16.16.0/24:(rw,nohide,insecure,sync,no_subtree_check)" >> /etc/exports