if test $(which pacman); then
    echo "updating packages"
    sudo pacman -Sy && pacman -Syu
    
    #if test ! $(which yaourt); then
    #  sudo pacman -S --noconfirm yaourt
    #fi

    if test ! $(which gcc); then
      sudo pacman -S --noconfirm gcc
    fi

    if test ! $(which ruby); then
      sudo pacman -S --noconfirm ruby
    fi

    sudo pacman -S --noconfirm wget \
    chromium \
    flatpak \
    firefox \
    curl \
    git \
    vim \
    tmux \
    zsh 
fi
source ../common/flatpak.sh

# mv /etc/pacman.d/pacman.conf ~/sysconfback
# cp repo/pacman.conf /etc/pacman.d/pacman.conf
