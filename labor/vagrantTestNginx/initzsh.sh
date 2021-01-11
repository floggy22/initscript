#!/bin/bash

echo "Install zsh"
sudo apt update
sudo apt -y install zsh
sudo apt -y install powerline fonts-powerline
sudo apt -y install zsh-syntax-highlighting

sudo usermod -s /usr/bin/zsh vagrant
cd /home/vagrant
su - vagrant -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k"
cp /vagrant/.p10k.zsh /home/vagrant/.
cp /vagrant/.zshrc /home/vagrant/.
chown vagrant:vagrant /home/vagrant/.p10k.zsh
chown vagrant:vagrant /home/vagrant/.zshrc
