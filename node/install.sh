#!/bin/sh
#
# Install global packages

if type "npm" > /dev/null; then
  npm install -g \
    gulp \
    bower \
    speed-test \
    broccoli-cli \
    postcss-debug 
fi
