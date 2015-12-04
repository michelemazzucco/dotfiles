msg() {
  printf "${yel} ${pur}$*${end}\n"
}

# Variables
dir=~/.dotfiles
now=`date +%Y-%m-%d-%H:%M:%S`
olddir=$HOME/.dotfiles_old/$now
files="gitconfig gitignore"

# Create symlink and create files in homedir from .dotfiles folder 
msg "Create files..."
for file in $files; do
  ln -s $dir/$file $HOME/.$file
done
