#!/bin/bash
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
