# -----------------------------------------------
# Install brew packages
# -----------------------------------------------

# Update brew
brew update

# Update all packages
brew upgrade --all

# Tap
brew tap caskroom/cask
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

# Some usefull packages
brew install git
brew install node
brew install tree
brew install tmux
brew install php56
brew install drush
brew install rbenv ruby-build

# -----------------------------------------------
# Install software
# -----------------------------------------------

# Browsers
brew cask install google-chrome
brew cask install firefox
brew cask install opera

# Tools
brew cask install transmit
brew cask install 1password
brew cask install dropbox
brew cask install harvest
brew cask install atom
brew cask install sublime-text
brew cask install iterm2
brew cask install cleanmymac
brew cask install appcleaner

# Design
brew cask install sketch
brew cask install sketch-toolbox
brew cask install adobe-creative-cloud
brew cask install rightfont

# IM
brew cask install slack
brew cask install skype

# For VMs
brew cask install parallels-desktop
