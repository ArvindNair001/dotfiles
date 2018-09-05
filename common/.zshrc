# Loading Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

for file in ~/.{aliases,powerlevel9k}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;


# ZSH Plugins
plugins=(
git,dnf,zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
