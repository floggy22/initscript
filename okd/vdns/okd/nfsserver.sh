#!/bin/bash
sudo apt install -y nfs-kernel-server

#sudo mkdir -p /var/nfs/general
#sudo chown nobody: /var/nfs/general
#sudo chmod a+w /var/nfs/general

sudo mkdir -p /var/nfs/okd4
sudo chown nobody:nogroup /var/nfs/okd4
sudo chmod a+w /var/nfs/okd4

#sudo echo "/var/nfs/general *(rw,insecure,sync,no_subtree_check,no_root_squash,no_all_squash)" >> /etc/exports
sudo echo "/var/nfs/okd4 *(rw,insecure,sync,no_subtree_check,no_root_squash,no_all_squash)" >> /etc/exports

systemctl restart nfs-server
showmount -e
exportfs -v