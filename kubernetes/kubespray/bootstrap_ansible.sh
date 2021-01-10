#!/bin/bash

echo "[TASK A1] Make ssh key"
ssh-keygen -b 2048 -t rsa -q -N "" -f ~/.ssh/id_rsa

echo "[TASK A2] Distribute ssh key"
apt install -y sshpass
ssh-keyscan -H ansible >> ~/.ssh/known_hosts
ssh-keyscan -H node1 >> ~/.ssh/known_hosts
ssh-keyscan -H node2 >> ~/.ssh/known_hosts
ssh-keyscan -H node3 >> ~/.ssh/known_hosts
ssh-keyscan -H node4 >> ~/.ssh/known_hosts
sshpass -f /vagrant/password.txt ssh-copy-id root@ansible
sshpass -f /vagrant/password.txt ssh-copy-id root@node1
sshpass -f /vagrant/password.txt ssh-copy-id root@node2
sshpass -f /vagrant/password.txt ssh-copy-id root@node3
sshpass -f /vagrant/password.txt ssh-copy-id root@node4

echo "[TASK A3] Install PIP"
apt install -y python3-pip

echo "[TASK A4] Clone repo and install dependency"
cd ~
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
pip3 install -r requirements.txt

echo "[TASK A%] Create install"
cd ~
cd kubespray
cp -rfp inventory/sample inventory/mycluster
declare -a IPS=(172.16.16.201 172.16.16.202 172.16.16.203 172.16.16.204)
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
ansible-playbook -i inventory/mycluster/hosts.yaml  --become --become-user=root cluster.yml