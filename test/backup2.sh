#!/usr/bin/bash
echo "$( dirname ${BASH_SOURCE})"
DOTFILES=$HOME/.dotfiles/common
timestamp=$(date +"%Y%m%d%H%M")
# DOTBACK="dotfiles-$timestamp"
# DOTLOC=$HOME/backup/
# mkdir -vp $DOTLOC
DOTBACK="$HOME/backup/dotfiles-$timestamp"
mkdir -vp $DOTBACK

files=$( find "$DOTFILES" -maxdepth 1 -mindepth 1 -type d)
for file in ${files[@]}; do
	dirname="$( basename $file)"
	if [ ! $dirname = ".vscode" ]; then
        contents=$(find -H $DOTFILES/$dirname -maxdepth 2 -mindepth 1 | sed 's/.dotfiles\/common\///')	
        #mkdir -p $HOME/backup/${DOTBACK}/$dirname
        mkdir -p ${DOTBACK}/$dirname
        #contents=$(find -H $DOTFILES/$dirname -maxdepth 2 -mindepth 1)
        	
        for content in $contents; do 
            target=$(echo "$content" |sed "s+${HOME}/+${DOTBACK}/+")
            echo -e "$content\n$target\n\n"
            if [ -d $content ]&&[ ! -e $target ]; then 
                echo -e "\n\ncreating folder $target\n"
                mkdir -p $target
            fi
            target=$( dirname $target )
            if [ -e $content ] && [ ! "$(basename $content)" == "share" ]; then
                echo "moving $content to $target"
                cp -a $content $target
            fi
        done
	else 
		echo -e "\nBacking up $dirname"
        target=${DOTBACK}
        if [ -e $HOME/$dirname ]; then
		   echo "Backing up $HOME/$dirname to $DOTBACK"
           cp -a ${HOME}/$dirname $target
        fi
	fi
done
