#!/bin/bash
#
# Vars and message functions.

# Vars
DOTS=$(pwd)
DEST=$HOME
TODAY=`date +%F`

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
