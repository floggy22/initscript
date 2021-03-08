#!/bin/bash

echo "[TASK A1] Make ssh key"
ssh-keygen -b 2048 -t rsa -q -N "" -f ~/.ssh/id_rsa

echo "[TASK A2] Distribute ssh key"
apt update
apt install -y sshpass
ssh-keyscan -H ansible >> ~/.ssh/known_hosts
ssh-keyscan -H node1 >> ~/.ssh/known_hosts
ssh-keyscan -H node2 >> ~/.ssh/known_hosts
ssh-keyscan -H node3 >> ~/.ssh/known_hosts
ssh-keyscan -H node4 >> ~/.ssh/known_hosts
ssh-keyscan -H ansible.labor.lan >> ~/.ssh/known_hosts
ssh-keyscan -H node1.labor.lan >> ~/.ssh/known_hosts
ssh-keyscan -H node2.labor.lan >> ~/.ssh/known_hosts
ssh-keyscan -H node3.labor.lan >> ~/.ssh/known_hosts
ssh-keyscan -H node4.labor.lan >> ~/.ssh/known_hosts

sshpass -f /vagrant/password.txt ssh-copy-id root@ansible
sshpass -f /vagrant/password.txt ssh-copy-id root@node1
sshpass -f /vagrant/password.txt ssh-copy-id root@node2
sshpass -f /vagrant/password.txt ssh-copy-id root@node3
sshpass -f /vagrant/password.txt ssh-copy-id root@node4

echo "[TASK A3] Install PIP"
apt install -y python3-pip
pip3 install ansible
