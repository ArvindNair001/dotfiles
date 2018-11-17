#!/usr/bin/env bash
set -e 
# Author : Arvind Hariharan Nair
# echo "installing Configurations"
# source install/link.sh

OS=''
DE=$XDG_SESSION_DESKTOP
TEMP_DIR=$(pwd ${BASH_SOURCE})/_TEMP
installer=scripts/_installer

#macOS
if [ "$(uname)" = "Darwin" ]; then
    echo -e -n "\nRunning on macOS "
    echo "$(sw_vers -productVersion)"
    OS='mac'
    source $installer/brew.sh
fi

#Linux condition
if [  "$(uname)" = "Linux" ]; then
    if [ "$(cat /etc/issue | awk '{ print $1 }')" = "Arch"  ]; then
        echo -e "Running Arch Linux"
        OS='Arch'
        source $installer/arch/pacman.sh

    elif [ "$(cat /etc/issue | awk '{ print $1 }')" = "Manjaro" ]; then
        echo -e "Running Manjaro Linux"
        OS='Manjaro'
        source $installer/arch/pacman.sh 

    elif [ -f  /etc/debian_version ]; then
        echo -e "Running Debain or Debian based distro"
        OS='debian'
        source $installer/debian/apt-get.sh

    elif [ -f /etc/fedora-release ]; then
        echo -e "Running Fedora"
        OS='fedora'
        source $installer/fedora/dnf.sh
    fi

    if [ ! $OS = 'Arch' ]&&[ ! $OS = 'Manjaro' ]; then 
        sudo sh $installer/common/firefox-developer-install.sh
    fi

    if ! command -v firefox-nightly >/dev/null 2>&1; then
        sudo sh $installer/common/firefox-nightly-install.sh
    else
        echo -e "Firefox Nightly already installed...!"
    fi

    #if command -v flatpak >/dev/null 2>&1; then
     #   source $installer/common/flatpak.sh
    #else
     #   echo -e "Flatpak not installed, Skipping...!"
   # fi    
    # exporting zsh path to bash for chsh failsafe
    # sudo bash -c echo $(which zsh) >> /etc/shells
fi

#installing vscode Extensions
echo -e "Installing vscode Extensions"
if command -v code >/dev/null 2>&1; then
    source scripts/config/vscode-extensions.sh
else 
    echo -e "vscode not installed, Skipping...!"
fi
    
# configuring SSH
if [ ! -e $HOME/.ssh/id_rsa ]; then
    source scripts/config/ssh.sh
fi

if ! command -v rustup >/dev/null 2>&1; then
    echo "\nInstalling Rust"
    echo "$(curl https://sh.rustup.rs -sSf | sh -s -- -y)"
fi

# Installing ZSH modules
source scripts/config/zsh.sh
sleep 1.0
source scripts/config/backup.sh
sleep 1.0
source scripts/config/stow.sh

echo "Done"
env zsh
