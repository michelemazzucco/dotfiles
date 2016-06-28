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

# Symlink all files in Home
symlink_files() {
  message 'Symlink all dots in your home folder...'
  for file in $(find -H "$DOTS" -maxdepth 2 -name '*.symlink'); do
    # TODO - Create a backup copy before override
    ln -sfn "$file" "$DEST/.$(basename "${file%.*}")"
  done
  all_ok
}

# Install Oh My Zsh
setup_oh_my_zsh() {
  if [[ ! -d "$DEST/.oh-my-zsh" ]]; then
    message 'Installing Oh My Zsh...'
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    all_ok
  fi
}

# Symlink vim folder and creates its subdirectories
setup_vim_folder() {
  message 'Setup Vim folder...'
  if [[ -d "$DEST/.vim" ]]; then
    ln -s "$DOTS/vim" "$DEST/.vim"
  else
    rm -rf "$DEST/.vim"
    ln -s "$DOTS/vim" "$DEST/.vim"
  fi

  # Create vim folders
  mkdir -p "$DEST/.vim/undo" \
    "$DEST/.vim/swaps" \
    "$DEST/.vim/backups"
  all_ok
}

# TODO - symlink of Tmux folder in your home

# Create bin folder and symlink content
setup_bin_folder() {
  message 'Setup bin folder and copy the files..'
  mkdir -p $DEST/bin
  for file in $DOTS/bin/*; do
    ln -sfn "$file" "$DEST/bin/"
  done
  all_ok
}

# Copy fav fonts into system fonts folder
copy_fonts() {
  if [ -d "$DEST/Library/Fonts" ]; then
    message 'Copying fonts in your Library Fonts folder...'
    for file in $DOTS/fonts/*; do
      cp -rf $file "$DEST/Library/Fonts"
    done
    all_ok
  fi
}

setup_subl() {
  PACK=Package\ Control.sublime-settings
  PREF=Preferences.sublime-settings
  SUBL="$DEST/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/"

  ln -sfn "$DOTS/sublime/"{"$PACK","$PREF"} "$SUBL"
}

# Main function - wrap all things
main() {
  symlink_files
  setup_oh_my_zsh
  setup_vim_folder
  setup_bin_folder
  setup_subl
  copy_fonts
}

main "$@"
