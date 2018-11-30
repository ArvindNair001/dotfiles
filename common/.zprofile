# Enviroment variables
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$ZSH/custom"
export EDITOR=vim
export HISTSIZE=1000000
export TERM="xterm-256color"
export PATH="$HOME/.cargo/bin:$PATH"
export NPM_CONFIG_PREFIX=$HOME/.npm-global
export PATH=$HOME/.npm-global/bin:$PATH
export GPG_TTY=$(tty) 
if [ $XDG_SESSION_DESKTOP = "gnome" ]; then
	export TERMINAL=tilix
	export QT_STYLE_OVERRIDE=kvantum
elif [ $XDG_SESSION_DESKTOP = "KDE" ]; then
	export TERMINAL=konsole
	export GIT_ASKPASS=`which ksshaskpass`
	export SSH_ASKPASS=`which ksshaskpass`
fi
