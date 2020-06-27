#!/bin/sh

vbv=6.1.10

echo "Update"
sudo yum clean all
sudo yum -y update

sudo yum -y install cockpit
sudo systemctl enable --now cockpit.socket
sudo firewall-cmd --permanent --add-service=cockpit
sudo firewall-cmd --reload


echo "Ansible"
sudo yum -y install epel-release
sudo yum -y install ansible

echo "VirtualBox"
sudo yum -y install gcc kernel-devel kernel-headers dkms make bzip2 perl

cd /tmp
wget http://download.virtualbox.org/virtualbox/$vbv/VBoxGuestAdditions_$vbv.iso
sudo mount -t iso9660 -o loop VBoxGuestAdditions_$vbv.iso /media/

cd /media
sudo sh ./VBoxLinuxAdditions.run
cd /tmp
sudo umount /media
rm VBoxGuestAdditions_$vbv.iso

#ssh-keygen -b 2048 -t rsa -q -N ""

cd ~
#curl -fsSL https://get.docker.com -o get-docker.sh
#sudo sh get-docker.sh
#sudo usermod -aG docker martin
#sudo systemctl start docker
