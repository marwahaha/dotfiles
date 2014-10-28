#!/usr/bin/env bash
echo "==> Updating package manager..."
apt-get update

echo "==> Installing packages..."
apt-get install -y zsh git fortune cowsay

# Make vagrant run vagrant.zsh on first login
echo "rm -f ./.zshrc && /vagrant/bin/vagrant.zsh" >! /home/vagrant/.zshrc

# Change default shell for vagrant
chsh -s $(which zsh) vagrant
