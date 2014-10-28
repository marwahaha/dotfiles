#!/usr/bin/env bash
echo "==> Updating package manager..."
apt-get update

echo "==> Installing packages..."
apt-get install -y zsh git fortune cowsay

# Run vagrant.zsh as vagrant
runuser -l vagrant -c '/vagrant/bin/vagrant.zsh'
