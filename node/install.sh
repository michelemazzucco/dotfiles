#!/bin/sh
#
# Install global packages

if type "npm" > /dev/null; then
  # message "Installing npm packages..."
  npm install -g \
    gulp \
    bower \
    speed-test \
    vue-cli
  # ok
fi
