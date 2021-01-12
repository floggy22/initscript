#!/bin/bash

echo "Install zsh"
sudo apt update
sudo apt -y install zsh
sudo apt -y install powerline fonts-powerline
sudo apt -y install zsh-syntax-highlighting

sudo usermod -s /usr/bin/zsh $(whoami)
cd ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
cp /vagrant/.p10k.zsh ~/.
cp /vagrant/.zshrc ~/.
#chown vagrant:vagrant ~/.p10k.zsh
#chown vagrant:vagrant /home/vagrant/.zshrc
