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

