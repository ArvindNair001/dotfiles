# Loading Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# ZSH Plugins
plugins=(
    git zsh-autosuggestions 
	#zsh-syntax-highlighting
)
source $ZSH/oh-my-zsh.sh

for file in ~/.{aliases,localrc,powerlevel9k,zprofile}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

## Run tmux if exists
#if command -v tmux>/dev/null; then
#	[ -z $TMUX ] && exec tmux
#else
	#echo "tmux not installed."
#fi
