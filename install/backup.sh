#!/usr/bin/env bash
DOTFILES=$HOME/.dotfiles
DOTBACK=$HOME/dotfiles_backup

echo "creating backup at $DOTBACK"
mkdir -p -v $DOTBACK

linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )

for file in $linkables; do
    filename=".$( basename $file '.symlink' )"
    target="$HOME/$filename"
    if [ ! -L $target ]; then
        echo "backing up $filename"
        cp $target $DOTBACK
    else
        echo -e "$filename does not exist at this location or is a symlink"
    fi
done

files=("$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc")
for filename in "$HOME/.config/nvim" "$HOME/.vim" "$HOME/.vimrc"; do
    if [ ! -L $filename ]; then
        echo "backing up $filename"
        cp -rf $filename $DOTBACK
    else
        echo -e "$filename does not exist at this location or is a symlink"
    fi
done
