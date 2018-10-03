#!/usr/bin/bash
DOTBACK=$HOME/backup/dotfiles
#echo "creating backup at $DOTBACK"
[[ -d $DOTBACK ]] || mkdir -p -v $DOTBACK

ignorearr=(
--exclude=".vscode"
--exclude=".cargo"
--exclude="Steam" 
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
~/.[^.]* $HOME/backup/dotfiles >> $TEMP_DIR/rsync.log