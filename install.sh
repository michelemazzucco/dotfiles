msg() {
  printf "${yel} ${pur}$*${end}\n"
}

# Variables
dir=~/.dotfiles
now=`date +%Y-%m-%d-%H:%M:%S`
olddir=$HOME/.dotfiles_old/$now
files="gitconfig gitignore zshrc"

### Create symlink and create files in homedir from .dotfiles folder 
##msg "Create files..."
##for file in $files; do
##  ln -s $dir/$file $HOME/$file
##done

# Create symlink and create files in .dotfiles folder from homedir 
msg "Create files in .dotfiles..."
for file in $files
do
  msg "Creating $file..."
  ln -s ~/$file $dir/$file
done