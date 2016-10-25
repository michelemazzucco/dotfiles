#!/bin/bash
#
# Sublime text preferences and packages.

# Import config
source './scripts/utils.sh'

subl_symlinks() {
  PACK=Package\ Control.sublime-settings
  PREF=Preferences.sublime-settings
  SUBL="$DEST/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/"

  ln -sfn "$DOTS/sublime/"{"$PACK","$PREF"} "$SUBL"
}

subl_symlinks "$@"
