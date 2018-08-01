#!/usr/bin/env bash

# Author : Arvind Hariharan Nair

# source intall/backup.sh

# echo "installing Configurations"
# source install/link.sh

OS=''
#macOS
if [ "$(uname)" == "Darwin" ]; then
    echo -e -n "\nRunning on macOS "
    echo "$(sw_vers -productVersion)"
    OS='mac'
    source install/brew.sh
fi

#Linux condition
if [  "$(uname)" == "Linux" ]; then
    if [ "$(cat /etc/arch-release)" == "Arch Linux" ]||[ "$(cat /etc/arch-release)" == "Manjaro Linux" ]; then
        echo -e "Running Arch Linux"
        OS='arch'
        source install/arch/pacman.sh

    elif [ -f  /etc/debian_version ]; then
        echo -e "Running Debain or Debian based distro"
        OS='debian'
        source install/debian/apt-get.sh

    elif [ -f /etc/fedora-release ]; then
        echo -e "Running Fedora"
        OS='fedora'
        source install/fedora/dnf.sh
    fi

    # installing firefox developer edition
    if [ ! $OS = 'arch' ]; then 
        sudo sh ./install/common/firefox-developer-install.sh
    fi
    
    # exporting zsh path to bash for chsh failsafe
     sudo bash -c echo $(which zsh) >> /etc/shells
fi

#installing vscode Extensions
source install/common/vscode-extensions.sh

# configuring SSH
if [ ! -e $HOME/.ssh/id_rsa ]; then
    source install/common/ssh.sh
fi

if ! command -v rustup >/dev/null 2>&1; then
    echo "\nInstalling Rust"
    echo "$(curl https://sh.rustup.rs -sSf | sh -s -- -y)"
fi

# Installing ZSH modules
source install/common/zsh.sh

source install/backup.sh
source install/stow.sh

echo "Done"
env zsh