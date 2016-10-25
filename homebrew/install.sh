#!/bin/bash
#
# Install Homebrew and packages with Brew bundle.

# Brew hard cleanup
brew_clean() {
  brew cleanup && brew cask cleanup
}

if type "brew" > /dev/null; then
  echo "Homebrew found. Let's Go!"
  brew update
else
  echo "Homebrew not found. Installing..."
  `ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"`
fi

# Install Brew bundle
if printf "brew bundle"  > /dev/null; then
  echo "Brew bundle found."
else
  echo "Homebrew not found. Installing..."
  brew tap Homebrew/bundle
fi

brew bundle
brew_clean

# After El Captin update use it
# brew link openssl --force
