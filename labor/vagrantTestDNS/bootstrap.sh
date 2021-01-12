#!/bin/bash

sudo dnf update -y
sudo dnf install -y bind bind-utils nano
sudo firewall-cmd --permanent --add-port={53/udp,53/tcp}  
sudo systemctl reload firewalld