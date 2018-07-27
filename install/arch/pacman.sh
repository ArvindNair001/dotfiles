#if test $(which pacman); then
#if command -v pacman >/dev/null 2>&1; then
    
    echo "selecting fastest Mirrors"
    sudo pacman-mirrors -g

    echo "updating packages"
    sudo pacman -Sy && sudo pacman -Syu
    
    if command -v yaourt >/dev/null 2>&1; then
      sudo pacman -S --noconfirm yaourt
    fi

    if command -v gcc >/dev/null 2>&1; then
      sudo pacman -S --noconfirm gcc
    fi

    if command -v ruby >/dev/null 2>&1; then
      sudo pacman -S --noconfirm ruby
    fi

    sudo pacman -S --noconfirm binutils \
    calibre \
    chromium \
    flatpak \
    firefox \
    firefox-developer-edition \
    curl \
    gnome-software \
    gnome-mpv \
    htop \
    jdk10-openjdk \
    nodejs \
    npm \
    python-nautilus \
    vim \
    stow \
    tlp \
    tlp-rdw \
    transmission-remote-gtk \
    tmux \
    tilix \
    wget \
    yay \
    zsh 
#fi
yaourt -S --noconfirm visual-studio-code-bin
source install/common/flatpak.sh

# mv /etc/pacman.d/pacman.conf ~/sysconfback
# cp repo/pacman.conf /etc/pacman.d/pacman.conf
