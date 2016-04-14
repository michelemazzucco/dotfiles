# -----------------------------------------------------------------
# Import utils
# -----------------------------------------------------------------
source ./utils.sh

# -----------------------------------------------------------------
# Check dest dir is provided
# -----------------------------------------------------------------
if [ -z "$1" ]; then
  error "Please provide dest dir, i.e. 'install.sh ~' OR 'install.sh $HOME' OR 'install.sh ./test'";
  exit
else
  dest=$1
  mkdir -p $dest #creating dest dir if not exists
  message "Symlinking dotfiles in '$1'...";
fi

# -----------------------------------------------------------------
# Variables
# -----------------------------------------------------------------
dir=$(pwd) # reading dir from current directory
now=`date +%Y-%m-%d-%H:%M:%S`

# -----------------------------------------------------------------
# Create symlink and create files in homedir from .dotfiles folder
# -----------------------------------------------------------------
file_paths=$dir/*
file_name_excluded="install.sh fonts iterm sublime Brewfile osx README.md utils.sh"
message "Remove old files and create new files symlinked..."
for file_path in $file_paths
do
  file_name="${file_path##*/}"  # get filename
  if ! [[ $file_name_excluded =~ $file_name ]]; then # check path is not excluded
    message "Processing $file_name..."
    rm -rf $dest/.$file_name
    ln -s $file_path $dest/.$file_name
    ok
  fi
done
exit

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

# After El Captin update use it
# brew link openssl --force

# -----------------------------------------------------------------
# npm packages
# -----------------------------------------------------------------
if type "npm" > /dev/null; then
    message "Installing npm packages..."
    npm install --global gulp bower speed-test nodemon
    ok
fi

# -----------------------------------------------------------------
# Install Ruby gems
# -----------------------------------------------------------------
if type "rbenv" > /dev/null; then
    message "Installing Ruby with rbenv..."
    # Change ruby version if you want
    rbenv install 2.2.4 && rbenv local 2.2.4 && rbenv rehash
    # Install gems
    message "Installing some gems..."
    gem install sass && gem install jekyll && gem install bundle && gem install compass && gem install rails -v 4.2.4
    ok
fi

# -----------------------------------------------------------------
# Install Pow
# -----------------------------------------------------------------
if [ ! -d "$dest/.pow" ]; then
  message "Installing Pow..."
  curl get.pow.cx | sh
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
if [ ! -d "$dest/.oh-my-zsh" ]; then
  message "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  ok
fi

if [ -d "$dest/.oh-my-zsh" ]; then
  mkdir -p $dest/.oh-my-zsh/custom/themes
  ln -s $dir/term/mhl.zsh-theme $dest/.oh-my-zsh/custom/themes
fi

# -----------------------------------------------------------------
# Vim
# -----------------------------------------------------------------
if [ -d "$dest/.vim" ]; then
  ln -s $dir/vim $dest/.vim
else
  rm -rf $dest/.vim
  ln -s $dir/vim $dest/.vim
fi

mkdir $dest/.vim/undo $dest/.vim/swaps $dest/.vim/backups

# -----------------------------------------------------------------
# bin folder
# -----------------------------------------------------------------
if [ -d "$dest/bin" ]; then
  ln -s $dir/bin/* $dest/bin/
else
  mkdir $dest/bin/
  ln -s $dir/bin/* $dest/bin/
fi

# -----------------------------------------------------------------
# Fonts
# -----------------------------------------------------------------
if [ -d "$dest/Library/Fonts" ]; then
  message "Copying fonts in your Library Fonts folder..."
  cp -rf $dir/fonts/* $dest/Library/Fonts
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
