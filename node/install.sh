#!/bin/sh
#
# Install global packages

if command -v npm >/dev/null; then
  npm install -g \
    gulp \
    bower \
    speed-test \
    broccoli-cli \
    postcss-cli \
    postcss-debug  \
    create-react-app \
    webpack \
    npm-check \
    react-native-cli \
    gh-pages
fi
