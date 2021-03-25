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
172.16.16.200   ansible.labor.lan  ansible
172.16.16.201   node1.labor.lan    node1
172.16.16.202   node2.labor.lan    node2
172.16.16.203   node3.labor.lan    node3
172.16.16.204   node4.labor.lan    node4
EOF


echo "[TASK 4] Clone init repo"
#echo ""
cd ~
git clone https://github.com/floggy22/initscript.git


echo "[TASK A1] Make ssh key"
ssh-keygen -b 2048 -t rsa -q -N "" -f ~/.ssh/id_rsa

echo "[TASK 5] Add Repo"
curl -s https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
curl -sL https://repos.influxdata.com/influxdb.key | gpg --import

apt-get install -y apt-transport-https
apt-get install -y software-properties-common wget
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
echo "deb https://packages.grafana.com/oss/deb stable main" | sudo tee -a /etc/apt/sources.list.d/grafana.list


echo "[TASK 6] Update"
apt update
apt upgrade -y

echo "[TASK 7] Telegraf"
apt-get install -y telegraf
systemctl start telegraf

echo "[TASK 8] Influx"
apt-get install -y influxdb
systemctl unmask influxdb.service
systemctl start influxdb

echo "[TASK 9] Grafana"
apt-get install -y grafana
systemctl daemon-reload
systemctl start grafana-server
systemctl status grafana-server
systemctl status influxdb
systemctl status telegraf