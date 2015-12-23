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
plugins=(git)

# -----------------------------------------------
# General
# -----------------------------------------------
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PATH:$HOME/bin"
eval "$(rbenv init -)"

# -----------------------------------------------
# Source Oh my zsh
# -----------------------------------------------
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------
# Aliases
# -----------------------------------------------
alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"
alias cl="clear"

# apache and mysql aliases
alias goapache="apachectl start"
alias stopapache="apachectl stop"
alias gomysql="mysql.server start"
alias stopmysql="mysql.server stop"
alias publickey="pbcopy < ~/.ssh/id_rsa.pub"
