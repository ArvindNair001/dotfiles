#!/usr/bin/env bash
#Author : Arvind Hariharan Nair

source install/backup.sh

echo "installing Configurations"
source install/link.sh

#macOS
if [ "$(uname)"=="Darwin" ]; then
    echo -e -n "\nRunning on macOS "
    echo "$(sw_vers -productVersion)"
    source install/brew.sh
    # source install/nvm.sh
fi

echo "Configuring ZSH as default shell"
chsh -s $(which zsh)

echo "done"
