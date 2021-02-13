#!/bin/bash

echo "Clone init repo"
cd ~
git clone https://github.com/floggy22/initscript.git

apt install -y apache2 haproxy isc-dhcp-server 

echo "[TASK 1] Config HA Proxy"
mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.org
cd ~
cp /root/initscript/okd/vdns/okd/haproxy.cfg /etc/haproxy/haproxy.cfg
systemctl restart haproxy
systemctl status haproxy

echo "[TASK 2] Config Apache"
sed -i 's/Listen 80/Listen 8080/' /etc/apache2/ports.conf
systemctl restart apache2
systemctl status apache2
mkdir /var/www/html/okd4

echo "[TASK 3] Config DHCP"
cd ~
mv /etc/dhcp/dhcp.conf /etc/dhcp/dhcp.conf.org
cp /root/initscript/okd/vdns/okd/dhcpd.conf /etc/dhcp/dhcpd.conf
systemctl restart isc-dhcp-server
systemctl status isc-dhcp-server