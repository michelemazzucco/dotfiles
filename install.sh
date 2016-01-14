# -----------------------------------------------------------------
# Functions
# -----------------------------------------------------------------

message() {
  printf "$*\n"
}

ok() {
  printf "...done\n\n"
}

brew_clean() {
  brew update && brew upgrade && brew cleanup && brew cask cleanup
}

# -----------------------------------------------------------------
# Variables
# -----------------------------------------------------------------

dir=~/.dotfiles
now=`date +%Y-%m-%d-%H:%M:%S`
files="gitconfig gitignore zshrc"


# -----------------------------------------------------------------
# Create symlink and create files in homedir from .dotfiles folder
# -----------------------------------------------------------------

message "Remove old files and create new files symlinked..."
for file in $files
do
  rm -rf $HOME/.$file
  ln -s $dir/$file $HOME/.$file
done
ok


# -----------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------

# Install Homebrew
if type "brew" > /dev/null; then
  message "Homebrew found. Let's Go!"
else
  message "Homebrew not found. Installing..."
  echo "`ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"`"
  ok
fi


# Install Brew bundle
if printf "brew bundle"  > /dev/null; then
  message "Brew bundle found."
  brew bundle
  brew_clean
else
  message "Homebrew not found. Installing..."
  brew tap Homebrew/bundle
  brew bundle
  brew_clean
fi
ok


# -----------------------------------------------------------------
# npm packages
# -----------------------------------------------------------------

if type "npm" > /dev/null; then
    message "Installing npm packages..."
    npm install --global gulp
    npm install --global bower
    npm install --global speed-test
    # npm install --global nodemon
    ok
fi


# -----------------------------------------------------------------
# Install Ruby gems
# -----------------------------------------------------------------

if type "rbenv" > /dev/null; then
    message "Installing Ruby with rbenv..."
    # change ruby version if you want
    rbenv install 2.0.0-p645 && rbenv local 2.0.0-p645 && rbenv rehash
    # install gems
    gem install sass
    gem install jekyll
    ok
fi


# -----------------------------------------------------------------
# Shell
# -----------------------------------------------------------------

# Set Zsh as Default shell
if [[ ! `echo $SHELL` == "/bin/zsh" ]]; then
  message "Set Zsh as default shell..."
  chsh -s /bin/zsh
  ok
fi

# Install Oh my zsh if doesn't exist
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  message "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ok
fi


# -----------------------------------------------------------------
# Fonts
# -----------------------------------------------------------------

if [ -d "$HOME/Library/Fonts" ]; then
  message "Copying fonts in your Library Fonts folder..."
  cp -rf $dir/fonts/* $HOME/Library/Fonts
  ok
fi


# -----------------------------------------------------------------
# Sublime Configuration
# -----------------------------------------------------------------

# Remove your files
rm -rf /Users/$USER/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
rm -rf /Users/$USER/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings

# Symlink new config files
ln -s ~/.dotfiles/sublime/Preferences.sublime-settings /Users/$USER/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
ln -s ~/.dotfiles/sublime/Package\ Control.sublime-settings /Users/$USER/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Package\ Control.sublime-settings