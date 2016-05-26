# Features:
# Path is autoshortened to ~25 characters

set_status() {
  # Colors 
  SUCCESS_COLOR=$FG[012]
  FAILURE_COLOR=$FG[009]

  echo "%(0?.%{$SUCCESS_COLOR%}.%{$FAILURE_COLOR%})"
}

set_prompt() {
  # Colors
  USER_HOME=%{$USER_COLOR%}%n%{$reset_color%}:
  USER_COLOR=$FG[255]
  
  # Clear prompt
  PROMPT=''

  PROMPT="$USER_HOME $(set_status)%25<...<%~%<<%{$reset_color%} %(!.#.$) "
}

set_rprompt() {
  # Colors
  GIT_COLOR=$FG[227]
  
  # Custom Git radar format
  export GIT_RADAR_FORMAT="%{remote}%{ :stash}%{ :changes}%{ :local} [%{branch}]"
  export GIT_RADAR_COLOR_BRANCH=$GIT_COLOR

  # Cler rprompt
  RPROMPT=''

  RPROMPT='$(git-radar --zsh)'
}

prompt_setup() {
  set_prompt
  set_rprompt
}

prompt_setup "$@"
