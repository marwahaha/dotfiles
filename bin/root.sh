#!/usr/bin/env bash
echo "==> Updating package manager..."
apt-get update

echo "==> Installing Git and Zsh..."
apt-get install -y zsh git fortune cowsay

# Run commands as vagrant
sudo -u vagrant /vagrant/bin/vagrant.zs
