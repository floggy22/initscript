#!/bin/bash

echo "Install zsh"
cd ~
sudo apt update
sudo apt -y install zsh
sudo apt -y install powerline fonts-powerline
sudo apt -y install zsh-syntax-highlighting

sudo usermod -s /usr/bin/zsh $(whoami)
cd ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
cp /vagrant/.p10k.zsh .
cp /vagrant/.zshrc .
echo "if [ $commands[kubectl] ]; then source <(kubectl completion zsh); fi" >> ~/.zshrc
