autoload colors && colors

# Theme Colors
ZSH_SUCCESS_COLOR=$FG[155]
FAILURE_COLOR=$FG[009]
USER_COLOR=$FG[255]
GIT_COLOR=$FG[249]

set_status() {
  echo "%(0?.%{$ZSH_SUCCESS_COLOR%}.%{$FAILURE_COLOR%})"
}

set_username() {
  echo "%{$USER_COLOR%}%n%{$reset_color%}:"
}

set_git_radar() {
  # Customize Git radar format
  export GIT_RADAR_FORMAT="%{remote}%{ :stash}%{ :changes}%{ :local} [%{branch}]"
  export GIT_RADAR_COLOR_BRANCH=$GIT_COLOR
  git-radar --zsh
}

set_prompt() {  
  # Clear prompt
  PROMPT=''
  PROMPT="$(set_username) $(set_status)%30<...<%~%<<%{$reset_color%} %(!.#.$) "
}

set_rprompt() {
  # Clear rprompt
  RPROMPT=''
  RPROMPT='$(set_git_radar)'
}

prompt_setup() {
  set_prompt
  set_rprompt
}

prompt_setup "$@"
