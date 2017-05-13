#!/bin/bash
#
# Install Antigen.

# Import config
source './scripts/utils.sh'

setup_antigen() {
  if [[ ! -f "$DEST/.antigen.zsh" ]]; then
    curl -L git.io/antigen > "$DEST/antigen.zsh"
  fi
}

setup_antigen "$@"
