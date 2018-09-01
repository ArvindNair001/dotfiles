if test $(which pacman); then
if command -v pacman >/dev/null 2>&1; then
    
    echo "selecting fastest Mirrors"
    sudo pacman-mirrors -g

    echo "updating packages"
    sudo pacman -Sy && sudo pacman -Syu
    
    if ! command -v yay >/dev/null 2>&1; then
      sudo pacman -S --noconfirm yay
    fi

    if ! command -v gcc >/dev/null 2>&1; then
      sudo pacman -S --noconfirm gcc
    fi

    if ! command -v ruby >/dev/null 2>&1; then
      sudo pacman -S --noconfirm ruby
    fi

    sudo pacman -S --noconfirm binutils \
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

if [ $OS == 'Manjaro']; then
    # remove unnecessary packages
    sudo pacman -Rn ms-office-online \
    imagewrtier \
    empathy \
    mpv
fi

if [ $OS == 'Arch' ]; then
    sudo pacman -S firefox \
    libreoffice-fresh\
    gufw\

    
fi
yay -S --noconfirm --aur visual-studio-code-bin
source install/common/flatpak.sh

# mv /etc/pacman.d/pacman.conf ~/sysconfback
# cp repo/pacman.conf /etc/pacman.d/pacman.conf
