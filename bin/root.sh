#!/usr/bin/env bash
echo "==> Updating package manager..."
apt-get update

echo "==> Installing packages..."
apt-get install -y zsh git fortune cowsay

# Change default shell for vagrant
chsh -s $(where zsh | head -n 1) vagrant

# Run vagrant.zsh as vagrant
runuser -l vagrant -c '/vagrant/bin/vagrant.zsh'
