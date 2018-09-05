#!/usr/bin/env bash
DOTFILES=$HOME/.dotfiles/common
DOTBACK=$HOME/backup/dotfiles
TEMP_DIR=$( dirname $(pwd ${BASH_SOURCE}))/_TEMP

mkdir -p $TEMP_DIR
#echo "$(find -H "$DOTFILES" -maxdepth 1 -mindepth 1 -type f )" > $TEMP_DIR/files
echo "parent directory is $( dirname $(pwd ${BASH_SOURCE}))"
echo -e "\ndirectory is $(pwd ${BASH_SOURCE})"
echo "creating backup at $DOTBACK"
mkdir -p -v $DOTBACK
: > $TEMP_DIR/files
linkables=$( find -H "$DOTFILES" -maxdepth 1 -mindepth 1 -type f )
files=$( find "$DOTFILES" -maxdepth 2 -mindepth 1 -type d)

for file in ${linkables[@]}; do    
    filename="$( basename $file )"
    echo -e "$filename" >> $TEMP_DIR/files
done

#for file in ${files[@]}; do    
#    filename="$( basename $file )"
#    echo -e "$filename" >> $TEMP_DIR/files
#done
    #rsync -avh --dry-run --no-links --progress --stats --include-from=$TEMP_DIR/files --exclude "*." --exclude "*/" $HOME/ $HOME/backup/dotfiles 
    #rsync -aAXv --dry-run --progress --include="$linkables" --exclude="*" $HOME $HOME/backup/dotfiles
    
    #rsync -aAXvh --no-links --stats --dry-run --exclude=".vscode" --exclude="Steam" --exclude=".dotfiles" --exclude=".oh-my-zsh"  --exclude=".var" --exclude=".rustup" --exclude=".mozilla" --exclude=".cache" --exclude="Trash" ~/.[^.]* $HOME/backup/test
    

    #backup command
    rsync -aAXvh --no-links --remove-source-files --stats  --exclude=".vscode" \
    --exclude="Steam" \
    --exclude=".dotfiles" \
    --exclude=".oh-my-zsh"  \
    --exclude=".var" \
    --exclude=".rustup" \
    --exclude=".mozilla" \
    --exclude=".cache" \
    --exclude="Trash" \
    ~/.[^.]* $HOME/backup/test

    #restore
    rsync -aAXvh --ignore-existing $HOME/backup/test/ $HOME
