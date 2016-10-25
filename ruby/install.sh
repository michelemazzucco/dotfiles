#!/bin/bash
#
# Use Ruby with rbenv and install some gems.

if command -v rbenv >/dev/null; then
  echo "Installing Ruby with rbenv..."
  # Change ruby version if you want
  rbenv install 2.2.4 && rbenv local 2.2.4 && rbenv rehash
  # Install gems
  message "Installing some gems..."
  gem install sass \
    jekyll \
    bundle \
    compass \
    rails -v 4.2.4
fi
