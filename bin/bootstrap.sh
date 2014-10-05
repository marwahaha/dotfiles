#!/usr/bin/env bash
# Clear logfile
> /vagrant/provision.log

echo "Updating package manager..."
apt-get update > /vagrant/provision.log 2>&1

echo "Installing Git and Zsh..."
apt-get install -y zsh git >> /vagrant/provision.log 2>&1

echo "Installing Meteor..."
curl -s https://install.meteor.com/ | sh >> /vagrant/provision.log 2>&1
# Configure ZSH
/vagrant/bin/prezto.zsh
