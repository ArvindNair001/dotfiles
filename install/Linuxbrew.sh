#!/bin/sh

if test ! $(which brew); then
  echo "installing Linuxbrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
  echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >> ~/.bash_profile
fi

echo -e "\n################################"
echo -e "\n installing Linuxbrew packages"
echo  -e "\n###############################"

#CLI tools
brew install tree
brew install wget

# development tools
brew install node
brew install tmux
brew install z
brew install zsh
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions

#upgrading packages

brew upgrade npm
npm install -g grunt-cli

exit 0
