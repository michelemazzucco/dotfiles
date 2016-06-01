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

all_ok() {
  printf "$GREEN...done!\n\n"
}

find . -name install--test.sh | while read installer;
  do ./"${installer}"
  all_ok
done
