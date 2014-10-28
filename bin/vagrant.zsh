#!/usr/bin/env zsh

SHARE="/vagrant"

echo "==> Installing Prezto..."
git clone --recursive -q https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -sf "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

echo "==> Installing NeoBundle..."
git clone -q https://github.com/Shougo/neobundle.vim "$HOME/.vim/bundle/neobundle.vim"

echo "==> Installing NeoBundle plugins..."
"$HOME/.vim/bundle/neobundle.vim/bin/neoinstall"

echo "==> Installing NVM..."
curl -sSL https://raw.githubusercontent.com/creationix/nvm/v0.17.3/install.sh | bash

echo "==> Installing RVM..."
curl -sSL https://get.rvm.io | bash -s stable

echo "==> Installing Meteor..."
curl -sSL https://install.meteor.com | /bin/sh

echo "==> Symlinking custom dotfiles..."
for rcfile in $SHARE/dotfiles/*; do
  ln -sf "$rcfile" "$HOME/.${rcfile:t}"
done

echo  "==> Installing Node..."
nvm install $(cat "$SHARE/dotfiles/nvmrc")

echo "==> Done!"
