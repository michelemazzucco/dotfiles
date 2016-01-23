# -----------------------------------------------
# Path to your oh-my-zsh installation.
# -----------------------------------------------
export ZSH=/Users/michele/.oh-my-zsh

# -----------------------------------------------
# Theme
# -----------------------------------------------
ZSH_THEME="mh"

# -----------------------------------------------
# Plugins
# -----------------------------------------------
plugins=(history git git-extras node npm brew)

# -----------------------------------------------
# General
# -----------------------------------------------
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$PATH:$HOME/bin"

if which rbenv &> /dev/null; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# -----------------------------------------------
# Source Oh my zsh
# -----------------------------------------------
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------
# Source Aliases
# -----------------------------------------------
source $HOME/.aliases