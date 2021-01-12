#!/bin/bash

echo "Install zsh"
sudo dnf update -y
sudo dnf install -y util-linux-user zsh zsh-syntax-highlighting powerline
sudo chsh -s $(which zsh)
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
#git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cd ~
#cp /vagrant/.p10k.zsh .
cp /vagrant/.zshrc . 

