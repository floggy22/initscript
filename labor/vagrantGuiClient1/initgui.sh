#!/bin/bash

echo "VirtualBox"
sudo apt-get update
sudo apt-get -y upgrade 
sudo apt install -y build-essential linux-headers-$(uname -r)
sudo apt install -y dkms
sudo apt install -y ubuntu-desktop

wget http://download.virtualbox.org/virtualbox/6.1.16/VBoxGuestAdditions_6.1.16.iso
sudo mount -t iso9660 -o loop VBoxGuestAdditions_6.1.16.iso /media/
cd /media
sudo ./VBoxLinuxAdditions.run
