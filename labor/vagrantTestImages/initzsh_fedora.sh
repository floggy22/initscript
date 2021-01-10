#!/bin/bash

echo "Install zsh"
sudo dnf update -y
sudo dnf install -y util-linux-user zsh zsh-syntax-highlighting powerline
sudo chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
cd ~
cp /vagrant/.p10k.zsh .
cp /vagrant/.zshrc . 


#su vagrant -c 'chsh -s $(which zsh)'
#sudo usermod -s /usr/bin/zsh vagrant
#cd /home/vagrant
#su - vagrant -c "git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k"
#cp /vagrant/.p10k.zsh /home/vagrant/.
#cp /vagrant/.zshrc /home/vagrant/.
#chown vagrant:vagrant /home/vagrant/.p10k.zsh
#chown vagrant:vagrant /home/vagrant/.zshrc
