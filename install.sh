# Snag the dependencies
brew bundle

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# Set reasonable OS X defaults
./osx
