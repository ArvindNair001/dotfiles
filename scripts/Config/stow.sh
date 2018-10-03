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
sleep 1.0

rsync -aAXvh --ignore-existing $HOME/backup/dotfiles/ $HOME