#!/bin/bash

echo "Enable ssh password authentication"
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd

echo "Set root password"
echo -e "kubeadmin\nkubeadmin" | passwd root >/dev/null 2>&1
echo "export TERM=xterm" >> /etc/bash.bashrc

echo "Clone init repo"
cd ~
git clone https://github.com/floggy22/initscript.git

echo "Add dns"
cd ~
bash initscript/clientdns/add_dns_centos.sh