#!/usr/bin/env zsh

setopt EXTENDED_GLOB

# If zprezto doesn't already exist, clone it.
VAGRANT_SHARE="/vagrant"
VAGRANT_HOME="/home/vagrant"

su vagrant

echo "Downloading Prezto..."
if [[ (! -d $VAGRANT_HOME"/.zprezto")]]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$VAGRANT_HOME/.zprezto" >> /vagrant/provision.log 2>&1
fi

echo "Downloading NeoBundle..."
git clone https://github.com/Shougo/neobundle.vim $VAGRANT_HOME/.vim/bundle/neobundle.vim >> /vagrant/provision.log 2>&1

# Default Prezto dotfiles
echo "Symlinking Prezto dotfiles..."
for rcfile in $VAGRANT_HOME/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "$VAGRANT_HOME/.${rcfile:t}" >> /vagrant/provision.log 2>&1
done

# Custom dotfiles
echo "Symlinking custom dotfiles..."
for rcfile in $VAGRANT_SHARE/dotfiles/*; do
  ln -sf "$rcfile" "$VAGRANT_HOME/.${rcfile:t}" >> /vagrant/provision.log 2>&1
done

echo "Installing NVM..."
curl -sSL https://raw.githubusercontent.com/creationix/nvm/v0.17.3/install.sh | bash 2>&1 >> /vagrant/provision.log 

echo "Installing RVM..."
curl -sSL https://get.rvm.io | bash -s stable >> /vagrant/provision.log 2>&1

echo "Setting default shell..."
chsh -s /bin/zsh vagrant >> /vagrant/provision.log 2>&1

echo "Done!"
