#!/bin/bash

sudo dnf update -y
sudo dnf install -y bind bind-utils nano
sudo firewall-cmd --permanent --add-port={53/udp,53/tcp} 
sudo firewall-cmd --permanent --add-port={953/udp,953/tcp}  
sudo systemctl reload firewalld

sudo rndc-confgen -a
sudo chgrp named /etc/rndc.key
sudo chmod g+r /etc/rndc.key

sudo cp /vagrant/dns/named.conf /etc/named.conf
sudo cp /vagrant/dns/named.zones /etc/named/named.zones

sudo cp /vagrant/dns/foward.labor /var/named/foward.labor
sudo cp /vagrant/dns/reverse.labor /var/named/reverse.labor
sudo systemctl restart named.service
dig -x server.labor.lan