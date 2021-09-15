#!/bin/bash

echo "[TASK 1] Enable ssh password authentication"
sed -i 's/^PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_config
systemctl reload sshd

echo "[TASK 2] Set root password"
echo -e "kubeadmin\nkubeadmin" | passwd root >/dev/null 2>&1
echo "export TERM=xterm" >> /etc/bash.bashrc

echo "[TASK 3] Update /etc/hosts file"
cat >>/etc/hosts<<EOF
172.16.16.200   server.labor.lan  server
172.16.16.201   node1.labor.lan   node1
172.16.16.202   node2.labor.lan   node2
172.16.16.203   node3.labor.lan   node3
172.16.16.204   node4.labor.lan   node4
EOF


echo "[TASK 4] Clone init repo"
#echo ""
cd ~
git clone https://github.com/floggy22/initscript.git


echo "[TASK 5] Make ssh key"
ssh-keygen -b 2048 -t rsa -q -N "" -f ~/.ssh/id_rsa

echo "[TASK 6] Update"
apt update
apt upgrade -y

echo "[TASK 7] Python DEV"
apt install python3-venv