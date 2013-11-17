#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.homesick/repos/dotfiles/vendor/prezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.homesick/repos/dotfiles/vendor/prezto/init.zsh"
fi

# Everybody loves fasd
source "${ZDOTDIR:-$HOME}/.homesick/repos/dotfiles/vendor/fasd/fasd"
eval "$(fasd --init auto)"

# Aliases are fun
source .aliases

# Wouldn't want these getting into the wrong hands...
source .secrets

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
