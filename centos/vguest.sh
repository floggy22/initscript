#!/bin/sh

vbv=6.1.16

echo "Update"

sudo dnf -y update

echo "VirtualBox"
sudo yum -y install epel-release
sudo yum -y install gcc kernel-devel kernel-headers dkms make bzip2 perl

cd /tmp
wget http://download.virtualbox.org/virtualbox/$vbv/VBoxGuestAdditions_$vbv.iso
sudo mount -t iso9660 -o loop VBoxGuestAdditions_$vbv.iso /media/

cd /media
sudo sh ./VBoxLinuxAdditions.run
cd /tmp
sudo umount /media
rm VBoxGuestAdditions_$vbv.iso

cd ~