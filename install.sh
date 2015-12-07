message() {
  printf "${yel} ${pur}$*${end}\n"
}

ok() {
  printf "...done\n\n"
}

# Variables
dir=~/.dotfiles
now=`date +%Y-%m-%d-%H:%M:%S`
olddir=$HOME/.dotfiles_old/$now
files="gitconfig gitignore zshrc"

# Create symlink and create files in homedir from .dotfiles folder
message "Create files..."
for file in $files
do
  ln -s $dir/$file $HOME/.$file
done
ok
