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

# -----------------------------------------------
# Source Oh my zsh
# -----------------------------------------------
source $ZSH/oh-my-zsh.sh

# -----------------------------------------------
# Aliases
# -----------------------------------------------
alias zshconfig="atom ~/.zshrc"
alias ohmyzsh="atom ~/.oh-my-zsh"

# apache and mysql aliases
alias goapache="apachectl start"
alias stopapache="apachectl stop"
alias gomysql="mysql.server start"
alias stopmysql="mysql.server stop"
