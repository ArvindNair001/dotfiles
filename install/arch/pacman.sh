#if test $(which pacman); then
#if command -v pacman >/dev/null 2>&1; then
    
    if [ $OS = 'Manjaro' ]; then 
        echo "selecting fastest Mirrors"
        sudo pacman-mirrors -g
    fi

    echo "updating packages"
    sudo pacman -Sy && sudo pacman -Syu
    
    if ! command -v yay >/dev/null 2>&1; then
      git clone https://aur.archlinux.org/yay.git && cd yay
      makepkg -si --noconfirm
    fi

    if ! command -v gcc >/dev/null 2>&1; then
      sudo pacman -S --noconfirm --needed gcc
    fi

    if ! command -v ruby >/dev/null 2>&1; then
      sudo pacman -S --noconfirm --needed ruby
    fi

    sudo pacman -S --noconfirm --needed binutils \
    calibre \
    chromium \
    flatpak \
    firefox-developer-edition \
    curl \
    gnome-software \
    gnome-mpv \
    htop \
    jdk10-openjdk \
    openjdk10-doc \
    nodejs \
    npm \
    python-nautilus \
    vim \
    stow \
    tlp \
    tlp-rdw \
    tmux \
    tilix \
    wget \
    zsh 
#fi

if [ $OS = 'Manjaro']; then
    # remove unnecessary packages
    sudo pacman -Rns ms-office-online \
    imagewrtier \
    empathy \
    mpv
fi

if [ $OS = 'Arch' ]; then
    sudo pacman -S --noconfirm --needed firefox \
    libreoffice-fresh \
    gufw \
    openssh \
    p7zip \
    unrar \ 
    rsync \
    steam \
    steam-native-runtime \
    
    
    yay -S --noconfirm --needed --aur pamac-aur

    
fi

yay -S --noconfirm --needed --aur visual-studio-code-bin
source install/common/flatpak.sh

# mv /etc/pacman.d/pacman.conf ~/sysconfback
# cp repo/pacman.conf /etc/pacman.d/pacman.conf
