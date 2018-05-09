# Creating Folder templates
user=$(logname)
home="/home/$user"

# Documents
mkdir -vp $home/Documents/Application\ Data
mkdir -vp $home/Documents/Crap
mkdir -vp $home/Documents/Dump
mkdir -vp $home/Documents/Notes
mkdir -vp $home/Documents/Development
mkdir -vp $home/Documents/Projects
mkdir -vp $home/Documents/Learning/Courses
mkdir -vp $home/Documents/Learning/Self

timestamp=$(date +"%Y%m%d%H%M")  

# Creating backups
BACKUP_DIR="$home/backup/dotfiles-$timestamp"
mkdir -vp $BACKUP_DIR
cp -rfp "$home/.*" $BACKUP_DIR

# Creating Symlinks
stow -vt $home ./../common 