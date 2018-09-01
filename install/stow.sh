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
    stow -vt $HOME common 
else 
    #KDE
    stow -vt --ignore=.config/nautilus $HOME  common 
fi