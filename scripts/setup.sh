#!/bin/bash
#
# Setup all the things.

# Import config
source './scripts/utils.sh'

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
  all_ok "$@"
}

# TODO - symlink of Tmux folder in your home

# Create bin folder and symlink content
setup_bin_folder() {
  message 'Setup bin folder and copy the files..'
  mkdir -p $DEST/bin
  for file in $DOTS/bin/*; do
    ln -sfn "$file" "$DEST/bin/"
  done
  all_ok "$@"
}

# Copy fav fonts into system fonts folder
copy_fonts() {
  if [ -d "$DEST/Library/Fonts" ]; then
    message 'Copying fonts in your Library Fonts folder...'
    for file in $DOTS/fonts/*; do
      cp -rf "$file $DEST/Library/Fonts"
    done
    all_ok "$@"
  fi
}

# Main function - wrap all things
main() {
  setup_vim_folder
  setup_bin_folder
  copy_fonts
}

main "$@"
