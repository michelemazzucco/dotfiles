set_status() {
  # Colors 
  SUCCESS_COLOR=$FG[012]
  FAILURE_COLOR=$FG[009]
  echo "%(0?.%{$SUCCESS_COLOR%}.%{$FAILURE_COLOR%})"
}

set_username() {
  # Colors
  USER_COLOR=$FG[255]
  echo "%{$USER_COLOR%}%n%{$reset_color%}:"
}

# Path is autoshortened to ~25 characters

set_prompt() {  
  # Clear prompt
  PROMPT=''
  PROMPT="$(set_username) $(set_status)%25<...<%~%<<%{$reset_color%} %(!.#.$) "
}

set_git_radar() {
  # Colors
  GIT_COLOR=$FG[227]
  
  # Custom Git radar format
  export GIT_RADAR_FORMAT="%{remote}%{ :stash}%{ :changes}%{ :local} [%{branch}]"
  export GIT_RADAR_COLOR_BRANCH=$GIT_COLOR
  git-radar --zsh
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
