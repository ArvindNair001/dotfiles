# Loading Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# ZSH Plugins
plugins=(
    git
	colored-man-pages
   	zsh-autosuggestions
	zsh-syntax-highlighting
)

for file in ~/.{aliases,localrc,powerlevel9k,zprofile}; do
    [ -r "$file" ] && [ -f "$file" ] && source "$file";
done;

source $ZSH/oh-my-zsh.sh
