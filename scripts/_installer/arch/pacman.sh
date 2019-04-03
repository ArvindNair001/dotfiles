#!/usr/bin

if [ $OS = 'Manjaro' ]; then 
    echo "selecting fastest Mirrors"
    sudo pacman-mirrors -g
fi

echo "updating packages"
sudo pacman -Sy && sudo pacman -Syu
sleep 1.0

echo "installing libraries"
sudo pacman -S --noconfirm --needed \ 
android-tools \
android-udev \
binutils \
cups \
curl \
flatpak \
fzf \
gcc \
gvfs-mtp \
gvim \
htop \
jdk-openjdk \
libmtp \
mtpfs \
networkmanager-openvpn \
nodejs \
npm \
openssh \
openjdk-doc \
p7zip \
python-pip \
rsync \
ruby \
stow \
tmux \
tlp \
tlp-rdw \
ufw \
unrar \
unzip \
wget \
zsh 

sleep 1.0

echo -e "installing extras"
sudo pacman -S --noconfirm --needed \
adobe-source-sans-pro-fonts \
aspell-en \
enchant \
gst-libav \
gst-plugins-good \
jre8-openjdk \
hunspell \
hunspell-en_US \
hunspell-en_GB \
hypen \
hypen-en \
icedtea-web \
languagetool \
libmythes \
mythes-en \
noto-fonts-emoji \
pkgstats \
ttf-anonymous-pro \
ttf-bitstream-vera \
ttf-dejavu \
ttf-droid \
ttf-gentium \
ttf-liberation \
ttf-ubuntu-font-family

echo "installing Common Applications"
sudo pacman -S --noconfirm --needed \
calibre \
chromium \
code \
firefox-developer-edition \
gimp \
libreoffice-fresh \
nextcloud-client \
steam \
steam-native-runtime \
qbittorrent \

sleep 1.0

# Gnome specific packages
if [ $XDG_SESSION_DESKTOP = 'gnome' ]; then
    echo "installing Gnome packages"
    sudo pacman -S --noconfirm --needed \
    gnome-software \
    gnome-mpv \
    gnome-tweaks\
    kvantum-qt5 \
    python-nautilus \
    tilix
fi

# KDE Specific apps
if [ $XDG_SESSION_DESKTOP = 'KDE' ]; then
    echo "installing KDE packages"
    sudo pacman -S --noconfirm --needed \
    ark \
    dolphin \
    dolphin-plugins \
    gwenview \
    kde-cli-tools \
    kdeutils \
    kinfocenter \
    konsole \
    kipi-plugins \
    okular \
    plasma-pa \
    plasma5-applets-redshift-control \
    redshift \
    spectacle \
    speedcrunch \
    vlc

    sleep 1.5

    pacman -Rns \
    kbackup \
    kfloppy \
    ktimer 
fi

if [ $OS = 'Manjaro' ]; then
    # remove unnecessary packages
    sudo pacman -Rns \
    ms-office-online \
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
    if [ $XDG_SESSION_DESKTOP = 'KDE' ]; then
        yay -S --noconfirm --needed --aur pamac-aur pamac-tray-appindicator
    else 
        yay -S --noconfirm --needed --aur pamac-aur
    fi

    # yay -S --noconfirm --needed --aur visual-studio-code-bin
fi
# mv /etc/pacman.d/pacman.conf ~/sysconfback
# cp repo/pacman.conf /etc/pacman.d/pacman.conf
