#!/bin/bash

echo "VirtualBox"
sudo apt-get update 
sudo apt install -y build-essential linux-headers-$(uname -r)
sudo apt install -y dkms
sudo apt-get -y install ubuntu-desktop
sudo apt-get -y install xubuntu-desktop

cd /tmp
wget http://download.virtualbox.org/virtualbox/6.1.16/VBoxGuestAdditions_6.1.16.iso
sudo mount -t iso9660 -o loop VBoxGuestAdditions_6.1.16.iso /media/



echo "Install GUI xfce4"

sudo apt-get -y upgrade
sudo apt-get install -y xfce4 virtualbox-guest-dkms virtualbox-guest-utils virtualbox-guest-x11
sudo sed -i 's/allowed_users=.*$/allowed_users=anybody/' /etc/X11/Xwrapper.config