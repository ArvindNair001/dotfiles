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
    if [ "$(cat /etc/issue)" == "Arch Linux" ]; then
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
    sudo sh ./install/common/firefox-developer-install.sh

    # exporting zsh path to bash for chsh failsafe
     sudo bash -c echo $(which zsh) >> /etc/shells
fi

# Configuring SSH
user=$(logname)
location="/home/$user/.ssh"

echo "Generating SSH Keys"
mkdir  -vp $location
ssh-keygen -t rsa -b 4096
chmod +600 .ssh
chmod +700 .ssh/*

echo "Installing Oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Configuring ZSH as default shell"
chsh -s $(which zsh)

echo "Installing POWERLEVEL9K"
echo "$(git clone https://github.com/bhilburn/powerlevel9k.git $ZSH_CUSTOM/themes/powerlevel9k)"

echo "installing zsh plugins"
echo "$(git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions)"

echo "\nInstalling Rust"
echo "$(curl https://sh.rustup.rs -sSf | sh)"

echo "Done"
