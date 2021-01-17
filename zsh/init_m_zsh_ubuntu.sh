#!/bin/bash

SPATH=`dirname $0`

echo "Install zsh"
sudo apt update
sudo apt -y install zsh powerline fonts-powerline zsh-syntax-highlighting

sudo usermod -s /usr/bin/zsh $(whoami)
cp $SPATH/.p10k.zsh ~/.
cp $SPATH/.zshrc ~/.
chown $(id -u):$(id -g) ~/.p10k.zsh
chown $(id -u):$(id -g) ~/.zshrc

pushd ~
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
popd

zsh