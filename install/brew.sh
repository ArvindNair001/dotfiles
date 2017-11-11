#!/bin/sh

if test ! $(which brew); then
  echo "installing Homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo "\n###############################"
echo -e "\ninstalling Homebrew packages"
echo  "################################"

#CLI tools
brew install tree
brew install wget

# development tools
brew install macvim --override-system-vim
brew install node
brew install tmux
brew install z
brew install zsh
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

#upgrading packages
brew upgrade npm
exit 0
