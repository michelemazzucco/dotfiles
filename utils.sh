#!/bin/bash

# -----------------------------------------------------------------
# Colors
# -----------------------------------------------------------------
export RED="\e[0;31m"
export GREEN="\e[0;32m"
export YELLOW="\e[1;33m"
export BLUE="\e[0;34m"

# -----------------------------------------------------------------
# Functions
# -----------------------------------------------------------------
# Messages
message() {
  printf "$BLUE$*\n"
}

error() {
  printf "$RED$*\n"
}

ok() {
  printf "$GREEN...done!\n\n"
}

# All
brew_clean() {
  brew update && brew upgrade && brew cleanup && brew cask cleanup
}
