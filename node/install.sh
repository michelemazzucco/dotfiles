#!/bin/sh
#
# Install global packages

if command -v npm >/dev/null; then
  npm install --global \
    create-react-native-app \
    create-react-app \
    speed-test \
    npm-check \
    yarn \
    gulp \
    now \
    n \
fi
