if test $(which pacman); then
    echo "updating packages"
    sudo pacman -Sy && pacman -Syu
    
    if test ! $(which yaourt); then
      sudo pacman -S --noconfirm yaourt
    fi

    if test ! $(which gcc); then
      sudo pacman -S --noconfirm gcc
    fi

    if test ! $(which ruby); then
      sudo pacman -S --noconfirm ruby
    fi

    sudo pacman -S --noconfirm wget \
    binutils \
    chromium \
    flatpak \
    firefox \
    firefox-developer-edition \
    curl \
    git \
    gnome-software \
    gnome-mpv \
    htop \
    nodejs \
    npm \
    python-nautilus \
    vim \
    tlp \
    tlp-rdw \
    tmux \
    tilix \
    zsh 
fi
yaourt -S --noconfirm visual-studio-code-bin
source install/common/flatpak.sh

# mv /etc/pacman.d/pacman.conf ~/sysconfback
# cp repo/pacman.conf /etc/pacman.d/pacman.conf
