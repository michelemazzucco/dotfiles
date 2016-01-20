message() {
  printf "$*\n"
}

ok() {
  printf "...done\n\n"
}

brew_clean() {
  brew update && brew upgrade && brew cleanup && brew cask cleanup
}