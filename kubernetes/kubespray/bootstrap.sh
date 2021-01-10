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
172.16.16.200   ansible.example.com     ansible
172.16.16.201   node1.example.com    node1
172.16.16.202   node2.example.com    node2
172.16.16.203   node3.example.com    node3
172.16.16.204   node4.example.com    node4

EOF

echo "[TASK 5] Update"
apt update