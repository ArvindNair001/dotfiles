#!/usr/bin/env bash

DOTFILES=$HOME/.dotfiles/common

echo -e "\nCreating symlinks"
echo "=============================="
linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
for file in $linkables ; do
    target="$HOME/.$( basename $file '.symlink' )"
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $file"
        ln -s $file $target
    fi
done

echo -e "\n\ninstalling to ~/.config"
echo "=============================="
if [ ! -d $HOME/.config ]; then
    echo "Creating ~/.config"
    mkdir -p -v $HOME/.config
fi
# configs=$( find -path "$DOTFILES/config.symlink" -maxdepth 1 )
for config in $DOTFILES/config/*; do
    target=$HOME/.config/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done

# Creating symlink for vscode 
echo "\n\nLinking vscode"
if [ ! -L $HOME/.vscode ]; then
    ln -s $DOTFILES/vscode $HOME/.vscode
else    
    echo -e "\nError linking vscode already exists !"
fi

echo "\nLinking Templates"
if [ ! -L $HOME/Templates ];then
    ln -s $DOTFILES/Templates $HOME/Templates
else 
    echo -e "\nError linking vscode already exists !"
fi

for config in $DOTFILES/local/share/*; do
    target=$HOME/.local/share/$( basename $config )
    if [ -e $target ]; then
        echo "~${target#$HOME} already exists... Skipping."
    else
        echo "Creating symlink for $config"
        ln -s $config $target
    fi
done
