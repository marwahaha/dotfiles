#!/usr/bin/env bash
echo "==> Updating package manager..."
apt-get update

echo "==> Installing packages..."
apt-get install -y zsh git fortune cowsay

# Change default shell for vagrant
chsh -s $(which zsh) vagrant

# Run vagrant.zsh as vagrant
sudo -u vagrant "/vagrant/bin/vagrant.zsh"
