#!/usr/bin/bash
DOTBACK=$HOME/backup/dotfiles
#echo "creating backup at $DOTBACK"
[[ -d $DOTBACK ]] || mkdir -p -v $DOTBACK

ignorearr=(
--exclude=".vscode"
--exclude=".cargo"
--exclude=".steam" 
--exclude=".dotfiles" 
--exclude=".oh-my-zsh"
--exclude=".npm"
--exclude=".npm-global"
--exclude=".var"
--exclude=".rustup"
--exclude=".mozilla"
--exclude=".ssh"
--exclude=".cache"
--exclude="Trash"
--exclude=".nvidia-settings-rc"
--exclude=".rustup"
--exclude=".pki"
--exclude="/.nv" 
)

rsync -aAXvh --no-links --remove-source-files --stats "${ignorearr[@]}" \
~/.[^.]* $HOME/backup/dotfiles >> $TEMP_DIR/rsync.log 2>&1

# command1 >> log_file 2>&1 for same file
# command1 >> log_file 2>> err_file for different files