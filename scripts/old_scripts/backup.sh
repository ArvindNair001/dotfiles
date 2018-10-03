#!/usr/bin/env bash
DOTFILES=$HOME/.dotfiles/common
DOTBACK=$HOME/backup/dotfiles

echo "creating backup at $DOTBACK"
mkdir -p -v $DOTBACK

# Moving config files
#linkables=$( find -H "$DOTFILES" -maxdepth 3 -name '*.symlink' )
linkables=$( find -H "$DOTFILES" -maxdepth 1 -mindepth 1 -type f )

for file in $linkables; do
    filename="$( basename $file )"
    target="$HOME/$filename"
    if [ ! -L $target ] && [ -e $target ]; then
        echo "backing up $filename"
        mv $target $DOTBACK
    else
        echo -e "$filename does not exist at this location or is a symlink"
    fi
done

# Moving config directories
files=$( find "$DOTFILES" -maxdepth 1 -mindepth 1 -type d)
for file in ${files[@]}; do
	dirname="$( basename $file)"
	if [ ! $dirname = ".vscode" ]; then
        contents=$(find -H $DOTFILES/$dirname -maxdepth 2 -mindepth 1 | sed 's/.dotfiles\/common\///')	
        mkdir -p ${DOTBACK}/$dirname
        for content in $contents; do 
            target=$(echo "$content" |sed "s+${HOME}/+${DOTBACK}/+")
            if [ -d $content ]&&[ ! -e $target ]; then 
                mkdir -p $target
            fi
            target=$( dirname $target )
            if [ -e $content ] && [ ! "$(basename $content)" == "share" ]; then
                mv $content $target
            fi
        done
	else 
        target=${DOTBACK}
        if [ -e $HOME/$dirname ]; then
           mv ${HOME}/$dirname $target
        fi
	fi
done

# files=$( find "$DOTFILES" -maxdepth 1 -mindepth 1 -type d)
# for file in ${files[@]}; do
# 	dirname="$( basename $file)"	
# 	if [ ! $dirname = ".vscode" ]; then
#         #contents=$(ls $DOTFILES/$dirname)
#         contents=$(find "$DOTFILES" -maxdepth 3 -mindepth 1)	
#         for content in $contents; do 
#             if [ $dirname = ".local" ];then
#                 dirname=
#                 target=$HOME/$dirname/$content
#                 if [ -e $target ]; then
#                     mv $target $DOTBACK/$dirname/share
#                 fi
#             else			
#                 target=$HOME/$dirname/$content
#                 if [ -e $target ]; then
#                     mv $target $DOTBACK/$dirname/
#                 fi
#             fi
#         done
# 	else 
# 		echo -e "\nBacking up $dirname"
#         if [ -e $HOME/$dirname ]; then
# 		   mv $HOME/$dirname $DOTBACK
#         fi
# 	fi
# done

#files=$( find "$DOTFILES" -maxdepth 1 -mindepth 1 -type d)
#for file in ${files[@]}; do
#	dirname="$( basename $file)"
#	srcname=".$( basename $dirname)"
#	contents=$(ls $DOTFILES/$dirname)	
#	if [ ! $dirname = "Templates" ]; then	
#        for content in $contents; do 
#            if [ $dirname = "local" ];then
#                target=$HOME/$srcname/share/fonts
#                if [ -e $target ]; then
#                    mv $target $DOTBACK/$dirname/share
#                fi
#            elif [ $dirname = "vscode" ]; then
#                echo -e "\n Backing up vscode configurations"
#                target=$HOME/.vscode
#                if [ -e $target ]; then
#                    mv $target $DOTBACK
#                fi
#            else			
#                target=$HOME/$srcname/$content
#                if [ -e $target ]; then
#                    mv $target $DOTBACK/$dirname/
#                fi
#            fi
#        done
#	else 
#		echo -e "\nBacking up $dirname"
#        if [ -e $HOME/$dirname ]; then
#		    mv $HOME/$dirname $DOTBACK
#        fi
#	fi
#done

# files=$( find "$DOTFILES" -maxdepth 1 -mindepth 1 -type d)
# for file in ${files[@]}; do
# 	dirname="$( basename $file)"	
# 	if [ ! $dirname = ".vscode" ]; then
#         contents=$(ls $DOTFILES/$dirname)	
#         for content in $contents; do 
#             if [ $dirname = ".local" ];then
#                 target=$HOME/$srcname/share/fonts
#                 if [ -e $target ]; then
#                     mv $target $DOTBACK/$dirname/share
#                 fi
#             else			
#                 target=$HOME/$dirname/$content
#                 if [ -e $target ]; then
#                     mv $target $DOTBACK/$dirname/
#                 fi
#             fi
#         done
# 	else 
# 		echo -e "\nBacking up $dirname"
#         if [ -e $HOME/$dirname ]; then
# 		   mv $HOME/$dirname $DOTBACK
#         fi
# 	fi
# done
