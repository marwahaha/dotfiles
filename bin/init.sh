#!/bin/sh
echo "Setting up user environment..."
/bin/sh -c '/vagrant/bin/root.sh 2>&1 > /vagrant/provision.log'
