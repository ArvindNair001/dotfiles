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

# Creating Symlinks
if [ $(echo $XDG_SESSION_DESKTOP) == 'gnome' ]; then
    echo "DE is Gnome"
    stow -vt --ignore=.config/plasma $HOME common 
elif [ $(echo $XDG_SESSION_DESKTOP) == 'KDE' ]; then
    echo "DE is KDE"
    stow -vt --ignore=.config/nautilus --ignore=.config/gtk-3.0 --ignore=.config/gtk-4.0 --ignore=.config/plasma $HOME common
    
    stow -vt $HOME/.config -d common/plasma
fi
