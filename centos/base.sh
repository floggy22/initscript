#!/bin/sh

echo "Update"
sudo dnf -y update

echo "Ansible"
sudo dnf makecache
sudo dnf -y install epel-release
sudo dnf makecache
sudo dnf -y install ansible


echo "VirtualBox"
sudo dnf -y install gcc kernel-devel kernel-headers dkms make bzip2 perl
wget http://download.virtualbox.org/virtualbox/6.1.8/VBoxGuestAdditions_6.1.8.iso
sudo mount -t iso9660 -o loop VBoxGuestAdditions_6.1.8.iso /media/

cd /media
sudo sh ./VBoxLinuxAdditions.run --nox11

ssh-keygen -b 2048 -t rsa -q -N ""
