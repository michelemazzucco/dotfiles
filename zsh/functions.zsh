# -----------------------------------------------------------------
# Colors
# -----------------------------------------------------------------
export RED="\e[0;31m"
export GREEN="\e[0;32m"
export YELLOW="\e[1;33m"
export BLUE="\e[0;34m"

# -----------------------------------------------------------------
# Go to project folder and open it, nothing special
# -----------------------------------------------------------------
function p() {
  base_url=$HOME/projects # Your projects folder
  project=$1
  if [[ ! -d $base_url/$project ]]; then
    printf "$RED""Project '$1' not exist. Try again!\n\n"
  else
    cd $base_url/$project
  fi
}

# complete folder name
compdef '_files -W "$HOME/projects"' p

# -----------------------------------------------------------------
# Add notes to my folder
# -----------------------------------------------------------------
function note() {
  today=`date +%F`
  base_url="$HOME/projects/my-notes"
  prv="$base_url/private"
  publ="$base_url/public"
  name="$1"
  extension=md

  if [[ "$1" == "prv" ]] && [[ ! -d $prv ]] || [[ ! -d $prv/$today ]]; then
    name=$2
    mkdir -p $prv/$today
    vim $prv/$today/$name.$extension
  elif [[ "$1" == "prv" ]] && [[ -d $prv ]] && [[ -d $prv/$today ]]; then
    name=$2
    vim $prv/$today/$name.$extension 
  elif [[ ! -z "$1" ]] && [[ ! "$1" == "prv" ]] && [[ -d $publ/$today ]]; then
    vim $publ/$today/$name.$extension
  elif [[ ! -z "$1" ]] && [[ ! "$1" == "prv" ]] && [[ ! -d $publ/$today ]]; then
    mkdir -p $publ/$today
    vim $publ/$today/$name.$extension 
  elif [[ -z "$1" ]]; then
    printf "$RED""Provide a file name, i.e. 'an <name-of-your-file>' OR 'an prv <name-of-your-file>'.\n"
  fi
}