#!/usr/bin/bash
echo "$( dirname ${BASH_SOURCE})"
DOTFILES=$HOME/.dotfiles/common
timestamp=$(date +"%Y%m%d%H%M")
DOTBACK="dotfiles-$timestamp"
DOTLOC=$HOME/backup/
mkdir -vp $DOTLOC

files=$( find "$DOTFILES" -maxdepth 1 -mindepth 1 -type d)
for file in ${files[@]}; do
	dirname="$( basename $file)"	
	if [ ! $dirname = ".vscode" ]; then
        contents=$(find -H $DOTFILES/$dirname -maxdepth 2 | sed 's/.dotfiles\/common\///')	
        #contents=$(find -H $DOTFILES/$dirname -maxdepth 2 -mindepth 1)
        	
        for content in $contents; do 
            target=$(echo "$content" |sed "s+${HOME}/+${HOME}/backup/${DOTBACK}/+")
            # echo -e "\n$HOME\n$DOTBACK\n"
            # echo -e "$content\n$target\n\n"
            if [ -d $target ]&&[ ! -e $target ]; then 
                mkdir -p $target
            elif [ ! -f $target ]; then
                target=$( dirname $target )
            fi
            if [ -e $content ]; then
                echo "moving $content to $target"
                cp -a $content $target
            fi
        done
	else 
		echo -e "\nBacking up $dirname"
        if [ -e $HOME/$dirname ]; then
		   echo "Backing up $HOME/$dirname to $DOTBACK"
        fi
	fi
done