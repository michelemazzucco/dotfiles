#!/bin/bash
#
# Install Homebrew and packages.

if type "brew" > /dev/null; then
  echo "Homebrew found. Let's Go!"
else
  echo "Homebrew not found. Installing..."
  echo "`ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"`"
  done
fi

# Install Brew bundle
if printf "brew bundle"  > /dev/null; then
  echo "Brew bundle found."
  brew bundle
  brew update && brew upgrade && brew cleanup
else
  echo "Homebrew not found. Installing..."
  brew tap Homebrew/bundle
  brew bundle
  brew update && brew upgrade && brew cleanup
fi
ok

# After El Captin update use it
# brew link openssl --force
