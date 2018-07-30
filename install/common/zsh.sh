#!/usr/bin/env bash
ZCUSTOM="$HOME/.oh-my-zsh/custom"
echo -e "Installing Oh my zsh"
source install/common/oh-my-zsh.sh

# git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
# cp $HOME/.zshrc $HOME/.zshrc.pre_oh-my-zsh
# cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc

echo "Installing POWERLEVEL9K"
echo "$(git clone https://github.com/bhilburn/powerlevel9k.git $ZCUSTOM/themes/powerlevel9k)"

echo "installing zsh plugins"
echo "$(git clone git://github.com/zsh-users/zsh-autosuggestions $ZCUSTOM/plugins/zsh-autosuggestions)"

#echo "Configuring ZSH as default shell"
#chsh -s $(which zsh)


