mkdir -vp $HOME/.npm-global
# Documents
mkdir -vp $HOME/Documents/Application\ Data
mkdir -vp $HOME/Documents/Dump
mkdir -vp $HOME/Documents/Notes
mkdir -vp $HOME/Documents/Development
mkdir -vp $HOME/Documents/Projects
mkdir -vp $HOME/Documents/Learning/Courses
mkdir -vp $HOME/Documents/Learning/Self

stow -vt $HOME common 

rsync -aAXvh --ignore-existing $HOME/backup/test/ $HOME

# Creating Symlinks
#if [ $XDG_SESSION_DESKTOP == 'gnome' ]; then
    #echo "DE is Gnome"
    #stow -vt --ignore=.config/plasma $HOME common 

# if [ $XDG_SESSION_DESKTOP == 'KDE' ]; then
#     echo "additional KDE files"    
    
#     for config in $DOTFILES/config/plasma/*; do
#         target=$HOME/.config/$( basename $config )
#         if [ -e $target ]||[ -l $target ]; then
#             echo "~${target#$HOME} already exists... Skipping."
#         else
#             echo "Creating symlink for $config"
#             ln -s $config $target
#         fi
#     done
# fi
