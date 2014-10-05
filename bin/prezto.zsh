#!/usr/bin/env zsh

setopt EXTENDED_GLOB

# If zprezto doesn't already exist, clone it.
VAGRANT_SHARE="/vagrant"
VAGRANT_HOME="/home/vagrant"

echo "Downloading Prezto..."
if [[ (! -d $VAGRANT_HOME"/.zprezto")]]; then
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$VAGRANT_HOME/.zprezto" >> /vagrant/provision.log 2>&1
fi

echo "Downloading NeoBundle..."
git clone https://github.com/Shougo/neobundle.vim $VAGRANT_HOME/.vim/bundle/neobundle.vim

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


echo "Setting default shell..."
chsh -s /bin/zsh vagrant >> /vagrant/provision.log 2>&1

echo "Chowning ~ to the \"vagrant\" user..."
sudo chown -R vagrant .

echo "Done!"
