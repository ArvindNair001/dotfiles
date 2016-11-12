#!/usr/bin/env bash
#Author : Arvind Hariharan Nair

echo "installing Configurations"
# source install/installsh

#macOS
if [ "$(uname)"=="Darwin" ]; then
    echo -e -n "\nRunning on macOS "
    echo "$(sw_vers -productVersion)"

    source install/brew.sh
    source install/nvm.sh
fi
#Linux condition
if [  "$(uname)"=="Linux" ]; then
    #Arch Linux
    if[ "$(cat /etc/issue)"=="Arch Linux" ]; then
      echo "Running on Arch Linux"
      source install/pacman.sh
    fi
fi
echo "Configuring ZSH as default shell"
chsh -s $(which zsh)

echo "done"
