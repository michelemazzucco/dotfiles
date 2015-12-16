# -----------------------------------------------------------------
# Functions
# -----------------------------------------------------------------

message() {
  printf "${yel} ${pur}$*${end}\n"
}

ok() {
  printf "...done\n\n"
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

message "Create files..."
for file in $files
do
  ln -s $dir/$file $HOME/.$file
done
ok


# -----------------------------------------------------------------
# Homebrew
# -----------------------------------------------------------------

# Install Homebrew
if `type brew &>/dev/null`; then
  message "Homebrew found. Let's Go!"
else
  message "Homebrew not found. Installing..."
  echo "`ruby -e \"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)\"`"
  ok
fi

# Install Brew bundle
if `type brew bundle &>/dev/null`; then
  message "Brew bundle found."
  brew bundle
  brew update
  brew cleanup
  brew cask cleanup
else
  message "Homebrew not found. Installing..."
  brew tap Homebrew/bundle
  brew bundle
  brew update
  brew cleanup
  brew cask cleanup
fi
ok


# -----------------------------------------------------------------
# Shell
# -----------------------------------------------------------------

# Set Zsh as Default shell
chsh -s /bin/zsh

# Install Oh my zsh if doesn't exist
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  message "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
ok
