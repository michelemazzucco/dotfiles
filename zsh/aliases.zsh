# General
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias cl="clear"
alias dot="cd ~/.dotfiles"
alias pro="cd ~/projects"
alias st="subl ."
alias pk="pbcopy < ~/.ssh/id_rsa.pub"
alias publickey="pbcopy < ~/.ssh/id_rsa.pub"
alias l="ls -l"

# Open files
alias f="open ."

# Git aliases
alias gs="git status"
alias ga="git add -A"
alias wip="git add -A && git commit -m 'WIP'"
alias gl="git log --all --graph --decorate"

# Apache and MySQL aliases
alias apache.start="sudo apachectl start"
alias apache.stop="sudo apachectl stop"
alias apache.restart="sudo apachectl restart"
alias mysql.start="brew services start mysql"
alias mysql.stop="brew services stop mysql"
alias mysql.restart="brew services restart mysql"

# Npm aliases
alias ni="npm install"
alias nis="npm install --save"
alias nid="npm install --save-dev"
alias nig="npm install --global"
alias nr="npm run"
alias ns="npm start"
alias nf="npm cache clean && rm -rf node_modules && npm install"

# Tmux aliases
alias tl="tmux list-sessions"
alias ta="tmux attach -t"

# Typos
alias npm unistall="npm uninstall"
alias brew unistall="brew uninstall"
alias eixt="exit"
