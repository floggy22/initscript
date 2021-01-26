#!/bin/bash


echo "[TASK 1] update"
dnf install -y epel-release
dnf update -y


echo "[TASK 2] remote access"
dnf install -y xrdp tigervnc-server
systemctl enable --now xrxp
firewall-cmd --zone=public --permanent --add-port=3389/tcp
firewall-cmd --reload


echo "[TASK 3] HA Proxy and Apache"
dnf install -y haproxy
dnf install -y httpd

echo "[TASK 4] Firewall AND SELinux"
firewall-cmd --permanent --add-port=6443/tcp
firewall-cmd --permanent --add-port=22623/tcp
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --permanent --add-port=8080/tcp
firewall-cmd --reload
setsebool -P httpd_read_user_content 1
setsebool -P haproxy_connect_any 1


echo "[TASK 5] Config HA Proxy"
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.org
cd ~
cp initscript/okd/okd4_init/haproxy.cfg /etc/haproxy/
systemctl enable haproxy
systemctl start haproxy
systemctl status haproxy

echo "[TASK 6] Config Apache"
sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
systemctl enable httpd
systemctl start httpd

echo "[TASK 7] Get OC Client / OC Installer"
cd ~
wget https://github.com/openshift/okd/releases/download/4.5.0-0.okd-2020-07-29-070316/openshift-client-linux-4.5.0-0.okd-2020-07-29-070316.tar.gz
wget https://github.com/openshift/okd/releases/download/4.5.0-0.okd-2020-07-29-070316/openshift-install-linux-4.5.0-0.okd-2020-07-29-070316.tar.gz
tar -zxvf openshift-client-linux-4.5.0-0.okd-2020-07-29-070316.tar.gz
tar -zxvf openshift-install-linux-4.5.0-0.okd-2020-07-29-070316.tar.gz
cd ~
mv kubectl oc openshift-install /usr/local/sbin/
