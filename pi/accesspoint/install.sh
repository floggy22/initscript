#!/bin/bash

echo "install partly"

sudo apt update
sudo apt upgrade -y
sudo apt install -y hostapd dnsmasq
sudo DEBIAN_FRONTEND=noninteractive apt install -y netfilter-persistent iptables-persistent

sudo systemctl unmask hostapd
sudo systemctl enable hostapd
