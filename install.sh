#!/usr/bin/env bash

#Author : Arvind Hariharan Nair

source intall/backup.sh

echo "installing Configurations"
source install/link.sh

#macOS
if [ "$(uname)" == "Darwin" ]; then
    echo -e -n "\nRunning on macOS "
    echo "$(sw_vers -productVersion)"
    source install/brew.sh
    # source install/nvm.sh
fi
#Linux condition
if [  "$(uname)" == "Linux" ]; then
    #developer tools
    source install/devel.sh
    source install/zsh.sh
    #source install/linuxbrew.sh

    # exporting zsh path to bash for chsh failsafe
    # sudo bash -c echo $(which zsh) >> /etc/shells
fi

echo "Configuring ZSH as default shell"
chsh -s $(which zsh)

echo "done"
