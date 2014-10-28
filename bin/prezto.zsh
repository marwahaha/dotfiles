#!/usr/bin/env zsh

setopt EXTENDED_GLOB

sudo -u vagrant -s zsh

VAGRANT_SHARE="/vagrant"
VAGRANT_HOME="/home/vagrant"
HOME="/home/vagrant/"

echo "==> Downloading Prezto..."
if [[ (! -d $VAGRANT_HOME"/.zprezto")]]; then
  git clone --recursive -q https://github.com/sorin-ionescu/prezto.git "$VAGRANT_HOME/.zprezto"
fi

echo "==> Downloading NeoBundle..."
git clone -q https://github.com/Shougo/neobundle.vim "$VAGRANT_HOME/.vim/bundle/neobundle.vim"

# Default Prezto dotfiles
echo "==> Symlinking Prezto dotfiles..."
for rcfile in $VAGRANT_HOME/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "$VAGRANT_HOME/.${rcfile:t}"
done

# Custom dotfiles
echo "==> Symlinking custom dotfiles..."
for rcfile in $VAGRANT_SHARE/dotfiles/*; do
  ln -sf "$rcfile" "$VAGRANT_HOME/.${rcfile:t}"
done

echo "==> Installing NVM..."
curl -sSL https://raw.githubusercontent.com/creationix/nvm/v0.17.3/install.sh | bash

echo "==> Installing RVM..."
curl -sSL https://get.rvm.io | bash -s stable

echo "Installing Vim plugins..."
vim +NeoBundleInstall +qall

echo "==> Setting default shell..."
chsh -s /bin/zsh

echo "==> Done!"
