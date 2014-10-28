#!/usr/bin/env bash
echo "==> Updating package manager..."
apt-get update

echo "==> Installing Git and Zsh..."
apt-get install -y zsh git fortune cowsay

echo "==> Installing Meteor..."
curl -s https://install.meteor.com/ | sh

# Configure ZSH
/vagrant/bin/prezto.zsh
