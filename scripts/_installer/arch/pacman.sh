#!/usr/bin

if [ $OS = 'Manjaro' ]; then 
    echo "selecting fastest Mirrors"
    sudo pacman-mirrors -g
fi

echo "updating packages"
sudo pacman -Sy && sudo pacman -Syu
sleep 1.0

echo "installing libraries"
sudo pacman -S --noconfirm --needed binutils \
curl \
flatpak \
gcc \
htop \
libmtp \
mtpfs\
nodejs \
npm \
networkmanager-openvpn \
openssh \
jdk-openjdk \
openjdk-doc \
fzf \
p7zip \
unrar \
rsync \
ruby \
stow \
tlp \
tlp-rdw \
gvim \
tmux \
ufw \
wget \
zsh 

sleep 1.0

echo -e "installing extras"
sudo pacman -S adobe-source-sans-pro-fonts \
aspell-en \
enchant \
gst-libav \
gst-plugins-good \
jre8-openjdk \
hunspell-en \
icedtea-web \
languagetool \
libmythes \
mythes-en \
pkgstats \
ttf-anonymous-pro \
ttf-bitstream-vera \
ttf-dejavu \
ttf-droid \
ttf-gentium \
ttf-liberation \
ttf-ubuntu-font-family

echo "installing Common Applications"
sudo pacman -S --noconfirm --needed calibre \
chromium \
firefox-developer-edition \
gimp \
libreoffice-fresh \
steam \
steam-native-runtime 
qbittorent \

sleep 1.0

# Gnome specific packages
if [ $XDG_SESSION_DESKTOP == 'KDE' ]; then
    sudo pacman -S --noconfirm --needed gnome-software \
    gnome-mpv \
    gnome-tweaks\
    kvantum-qt5 \
    python-nautilus \
    tilix
fi

# KDE Specific apps
if [ $XDG_SESSION_DESKTOP == 'KDE' ]; then
    sudo pacman -S --noconfirm --needed \

    vlc
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
    # if desktop is kde
    if [ $XDG_SESSION_DESKTOP == 'KDE' ]; then
        yay -S --noconfirm --needed --aur pamac-aur pamac-tray-appindicator
    else 
        yay -S --noconfirm --needed --aur pamac-aur
    fi

    yay -S --noconfirm --needed --aur visual-studio-code-bin
fi
# mv /etc/pacman.d/pacman.conf ~/sysconfback
# cp repo/pacman.conf /etc/pacman.d/pacman.conf
