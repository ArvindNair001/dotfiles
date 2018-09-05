#!/usr/bin/env bash

# Author : Arvind Hariharan Nair

# echo "installing Configurations"
# source install/link.sh

OS=''
DE=$XDG_SESSION_DESKTOP
TEMP_DIR=$( dirname $(pwd ${BASH_SOURCE}))/_TEMP
#macOS
if [ "$(uname)" = "Darwin" ]; then
    echo -e -n "\nRunning on macOS "
    echo "$(sw_vers -productVersion)"
    OS='mac'
    source scripts/brew.sh
fi

#Linux condition
if [  "$(uname)" = "Linux" ]; then
    if [ "$(cat /etc/arch-release)" = "Arch Linux" ]; then
        echo -e "Running Arch Linux"
        OS='Arch'
        source scripts/arch/pacman.sh

    elif [ "$(cat /etc/arch-release)" = "Manjaro Linux" ]; then
        echo -e "Running Manjaro Linux"
        OS='Manjaro'
        source scripts/arch/pacman.sh 

    elif [ -f  /etc/debian_version ]; then
        echo -e "Running Debain or Debian based distro"
        OS='debian'
        source scripts/debian/apt-get.sh

    elif [ -f /etc/fedora-release ]; then
        echo -e "Running Fedora"
        OS='fedora'
        source scripts/fedora/dnf.sh
    fi

    if [ ! $OS = 'Arch' ]&&[ ! $OS = 'Manjaro' ]; then 
        sudo sh scripts/common/firefox-developer-install.sh
    fi

    if command -v flatpak >/dev/null 2>&1; then
        source scripts/common/flatpak.sh
    else
        echo -e "Flatpak not installed, Skipping...!"
    fi    
    # exporting zsh path to bash for chsh failsafe
    # sudo bash -c echo $(which zsh) >> /etc/shells
fi

#installing vscode Extensions
echo -e "Installing vscode Extensions"
if command -v code >/dev/null 2>&1; then
    source scripts/common/vscode-extensions.sh
else 
    echo -e "vscode not installed, Skipping...!"
fi
    
# configuring SSH
if [ ! -e $HOME/.ssh/id_rsa ]; then
    source scripts/common/ssh.sh
fi

if ! command -v rustup >/dev/null 2>&1; then
    echo "\nInstalling Rust"
    echo "$(curl https://sh.rustup.rs -sSf | sh -s -- -y)"
fi

# Installing ZSH modules
source scripts/common/zsh.sh

source scripts/backup.sh
source scripts/stow.sh

echo "Done"
env zsh
