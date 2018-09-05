DOTBACK=$HOME/backup/dotfiles

echo "creating backup at $DOTBACK"
mkdir -p -v $DOTBACK

rsync -aAXvh --no-links --remove-source-files --stats  --exclude=".vscode" \
--exclude="Steam" \
--exclude=".dotfiles" \
--exclude=".oh-my-zsh"  \
--exclude=".var" \
--exclude=".rustup" \
--exclude=".mozilla" \
--exclude=".cache" \
--exclude="Trash" \
~/.[^.]* $HOME/backup/test >> $TEMP_DIR/rsync.log