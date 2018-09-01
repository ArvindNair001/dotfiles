# ALIAS
alias ls="ls -al"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias dirs="dirs -v"
alias ip="ip -c"

# Loading Theme
ZSH_THEME="powerlevel9k/powerlevel9k"

# POWERLEVEL9K Configuration

## POWERLEVEL9K Font 
POWERLEVEL9K_MODE="nerdfont-complete"

## PROMPT Configuration
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{black}%F{green} \uf155%f%F{black} %k\ue0b0%f "
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""

# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%K{white}%k"
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%K{green}%F{black} \uf155 %f%F{green}%k\ue0b0%f "

## Separators
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\ue0b0'
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=$'\ue0b1'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\ue0b2'
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\ue0b7'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_fedora_icon dir vcs)

## DIR configuration
POWERLEVEL9K_DIR_HOME_BACKGROUND=002
POWERLEVEL9K_DIR_HOME_FOREGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='black'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='yellow'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='black'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND=124
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"

## OS ICON Configuration
## Fedora
#POWERLEVEL9K_CUSTOM_FEDORA_ICON="echo "
#POWERLEVEL9K_CUSTOM_FEDORA_ICON_BACKGROUND=069
#POWERLEVEL9K_CUSTOM_FEDORA_ICON_FOREGROUND=072

## Manjaro
POWERLEVEL9K_CUSTOM_FEDORA_ICON="echo "
POWERLEVEL9K_CUSTOM_FEDORA_ICON_BACKGROUND=000
POWERLEVEL9K_CUSTOM_FEDORA_ICON_FOREGROUND=072

## Arch
# POWERLEVEL9K_CUSTOM_FEDORA_ICON="echo "
# POWERLEVEL9K_CUSTOM_FEDORA_ICON_BACKGROUND=000
# POWERLEVEL9K_CUSTOM_FEDORA_ICON_FOREGROUND=045

# END

# ZSH Plugins
plugins=(
git,dnf,zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh
