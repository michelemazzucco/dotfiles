#!/bin/bash
#
# Setup all the things.

# Vars
DOTS=$(pwd)
DEST=$HOME

# Functions for messages and errors
message() {
  printf "\r\033[00;34m>>>\033[0m $1\n"
}

error() {
  printf "$RED$*\n"
}

all_ok() {
  printf "\r\033[2K\033[00;32m✓ Done!\033[0m$1\n\n"
}

echo "******************************"
echo $DOTS;
echo $DEST;
echo "******************************"
all_ok

# Symlink all files in Home
symlink_files() {
  message "Symlink all dots in your home folder..."
  for file in $(find -H "$DOTS" -maxdepth 2 -name '*.symlink'); do
    echo $file;
  done
  all_ok
}

# Install Oh My Zsh
setup_oh_my_zsh() {
  if [[ ! -d "$DEST/.oh-my-zsh" ]]; then
    message "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    all_ok
  fi
}

# Symlink vim folder and creates its subdirectories
setup_vim_folder() {
  message "Setup Vim folder..."
  if [[ -d "$HOME/.vim" ]]; then
    ln -s $dir/vim $HOME/.vim
  else
    rm -rf $dest/.vim
    ln -s $dir/vim $HOME/.vim
  fi

  mkdir -p $HOME/.vim/undo \
    $HOME/.vim/swaps \
    $HOME/.vim/backups
  all_ok
}

symlink_files
# setup_oh_my_zsh
# setup_vim_folder
echo "-------------"

