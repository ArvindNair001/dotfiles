#!/usr/bin

if [ $OS = 'Manjaro' ]; then 
    echo "selecting fastest Mirrors"
    sudo pacman-mirrors -g
fi

echo "updating packages"
sudo pacman -Sy && sudo pacman -Syu
sleep 1.0

sudo pacman -S --noconfirm --needed binutils \
calibre \
curl \
chromium \
flatpak \
firefox \
firefox-developer-edition \
fzf \
gnome-software \
gnome-mpv \
gufw \
htop \
jdk10-openjdk \
kvantum-qt5 \
libreoffice-fresh \
nodejs \
npm \
openjdk10-doc \
openssh \
python-nautilus \
p7zip \
rsync \
unrar \
steam \
steam-native-runtime \
vim \
stow \
tlp \
tlp-rdw \
tmux \
tilix \
wget \
zsh 

if ! command -v gcc >/dev/null 2>&1; then
    sudo pacman -S --noconfirm --needed gcc
fi

if ! command -v ruby >/dev/null 2>&1; then
    sudo pacman -S --noconfirm --needed ruby
fi

if [ $OS = 'Manjaro' ]; then
    # remove unnecessary packages
    sudo pacman -Rns ms-office-online \
    imagewrtier \
    empathy \
    mpv
fi

if ! command -v yay >/dev/null 2>&1; then
    git clone https://aur.archlinux.org/yay.git $TEMP_DIR/yay && cd $TEMP_DIR/yay
    makepkg -si --noconfirm --needed
    sleep 1.0
fi

if command -v yay >/dev/null 2>&1; then
    # installing aur stuff
    yay -S --noconfirm --needed --aur pamac-aur
    sleep 1.0
    yay -S --noconfirm --needed --aur visual-studio-code-bin
fi
# mv /etc/pacman.d/pacman.conf ~/sysconfback
# cp repo/pacman.conf /etc/pacman.d/pacman.conf
