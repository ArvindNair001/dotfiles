mkdir -vp $HOME/.npm-global
# Documents
mkdir -vp $HOME/Documents/Application\ Data
mkdir -vp $HOME/Documents/Crap
mkdir -vp $HOME/Documents/Dump
mkdir -vp $HOME/Documents/Notes
mkdir -vp $HOME/Documents/Development
mkdir -vp $HOME/Documents/Projects
mkdir -vp $HOME/Documents/Learning/Courses
mkdir -vp $HOME/Documents/Learning/Self

#timestamp=$(date +"%Y%m%d%H%M")  
# Creating backups
#BACKUP_DIR="$HOME/backup/dotfiles-$timestamp"
#mkdir -vp $BACKUP_DIR
#cp -rfp "$HOME/.*" $BACKUP_DIR

# Creating Symlinks
stow -vt $HOME common 