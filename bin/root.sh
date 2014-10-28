#!/usr/bin/env bash
echo "==> Updating package manager..."
apt-get update

echo "==> Installing packages..."
apt-get install -y zsh git fortune cowsay

# Change default shell for vagrant
chsh -s $(which zsh) vagrant
