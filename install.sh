#!/bin/bash
#
# Main script.

# Import general setup
source ./scripts/setup.sh

# Run all installers
run_installers() {
  find . -mindepth 2 -name 'install.sh' | while read installer; do 
    #./"${installer}"
    message "Run ${installer}..."
    echo "${installer}" # TODO
    all_ok
  done
}

# OSX config
setup_osx_conf() {
  if [[ `uname` == "Darwin" ]]; then
    read -r -p "Are you sure to install my OSX configuration? [y/N] " resp
    case $resp in
      [yY]) 
        echo "./scripts/osx.sh" # TODO
        ;;
      *)
        message "Ok, no problem!"
        exit
        ;;
    esac
  fi
}

run_installers
setup_osx_conf

# Switch to Zsh
message "Switch to Zsh..."
chsh -s /bin/zsh
