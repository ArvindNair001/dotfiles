#!/usr/bin/env sh

echo "installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

source ~/.zshrc
echo "#plugins\n" >> ~/.zshrc

#plugins
echo "installing zsh plugins"
echo $(git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions)
echo "plugins=(zsh-autosuggestions)" >> ~/.zshrc


#echo -e "installing zplugin plugin manager"
#curl -sL zplug.sh/installer | zsh
