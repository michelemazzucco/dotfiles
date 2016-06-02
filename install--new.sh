#!/bin/bash
#
# Main setup.

# -----------------------------------------------------------------
# Functions
# -----------------------------------------------------------------
message() {
  printf "\r\033[00;34m>>>\033[0m $1\n"
}

error() {
  printf "$RED$*\n"
}

all_ok() {
  printf "\r\033[2K\033[00;32mDone!\033[0m$1\n"
}

# -----------------------------------------------------------------
# Installers
# -----------------------------------------------------------------
find . -name install--test.sh | while read installer;
  do ./"${installer}"
  all_ok
done

# -----------------------------------------------------------------
# OSX config
# -----------------------------------------------------------------
if [ "`uname`" == "Darwin" ]; then
  read -r -p "Are you sure to install my OSX configuration? [y/N] " resp
  case $resp in
    [yY]) 
        ./node/install--test.sh;;
    *)
      message 'Ok, no problem!'
      exit;;
  esac
fi
