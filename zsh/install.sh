#!/bin/bash
#
# Install Oh My Zsh.

# Import config
source './scripts/utils.sh'

setup_oh_my_zsh() {
  if [[ ! -d "$DEST/.oh-my-zsh" ]]; then
    message 'Installing Oh My Zsh...'
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    all_ok "$@"
  fi
}

setup_oh_my_zsh "$@"
