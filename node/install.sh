#!/bin/sh
#
# Install global packages

if command -v npm >/dev/null; then
  npm install --global \
    gulp \
    bower \
    speed-test \
    create-react-app \
    create-react-native-app \
    npm-check \
    surge
fi
