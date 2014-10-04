!/bin/bash
#################
#dotfile_deploy.sh
#This script creates symlinks forem the home diectory to any desired dotfiles in ~/dotfile
#################

dir=~/dotfils
olddir=~/dotfiles_old
files="bashrc vimrc "

#create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing  dotfiles in $HOME"
mkdir -p $olddir
echo "...done"
#change to the dotfiles directory
echo "Changing to the dotfiles directory"
cd $dir
echo "...done"

for file in $files; do
   echo "Moving any existing dotfiles from ~ to $olddir"
   mv ~/.$file ~/dotfiles_old/
   ehco "Creating symlink to $file in $HOME"
   ln -s $dir/$file ~/.$file
done

