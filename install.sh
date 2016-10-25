#!/bin/bash
#
# Main script.

# Import config
source './scripts/utils.sh'

# Symlink all files in Home
symlink_files() {
  message 'Symlink all dots in your home folder...'
  find . -name '*.symlink' | while read -r dot; do
    # TODO - Create a backup copy before override
    ln -sfn "$dot" "$DEST/.$(basename "${dot%.*}")"
  done
  all_ok "$@"
}

# Run setup
run_setup() {
  message 'Starting setup...'
  './scripts/setup.sh'
  all_ok "$@"
}

# Run all installers
run_installers() {
  find . -mindepth 2 -name 'install.sh' | while read -r installer; do
    message "Run ${installer}..."
    ./"${installer}"
    all_ok "$@"
  done
}

# OSX config
setup_osx_conf() {
  if [[ $(uname) == 'Darwin' ]]; then
    read -r -p 'Are you sure to install my OSX configuration? [y/N] ' resp
    case $resp in
      [yY])
        "./scripts/macos.sh"
        ;;
      *)
        message 'Ok, no problem!\n'
        ;;
    esac
  fi
}

main() {
  symlink_files "$@"
  run_setup "$@"
  run_installers "$@"
  setup_osx_conf "$@"
}

main "$@"

# Switch to Zsh
message 'Switch to Zsh...'
chsh -s /bin/zsh
