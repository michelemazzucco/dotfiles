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
  printf "\r\033[2K\033[00;32mDone!\033[0m$1\n"
}

echo "******************************"
echo $DOTS;
echo $DEST;
echo "******************************"
all_ok

# Symlink all files in Home
symlink_files() {
  for file in $(find -H "$DOTS" -maxdepth 2 -name '*.symlink'); do
    echo $file;

  done
}

symlink_files
echo "-------------"

