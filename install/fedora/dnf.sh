echo "Updating System"
sudo dnf update -y

source ./add-repo.sh

echo "Installing Softwares"
sudo dnf install -y \
htop \
ranger \
stow \
tilix \
tilix-nautilus \
paper-gtk-theme \
paper-icon-theme \
python2-gobject \
python3-gobject \
tmux \
yumex-dnf \
VirtualBox \
akmod-VirtualBox \
kernel-devel-uname-r \
zsh

# multimedia codecs
echo -e "Installing Restricted Extras"
dnf -y groupinstall multimedia
dnf -y install ffmpeg \
gnome-mpv \
ffmpeg-compact \
gstreamer1-plugin-openh264


#disabling COPR Repos
sudo dnf copr -y disable user501254/Paper
sudo dnf copr -y disable dirkdavidis/papirus-icon-theme

source ./../common/flatpak.sh