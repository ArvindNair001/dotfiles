echo "Updating System"
sudo dnf update -y

source install/fedora/add-repo.sh

echo "Installing Softwares"
sudo dnf install -y gnome-tweaks \
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
util-linux-user \
zsh

# multimedia codecs
echo -e "\nInstalling Multimedia"
sudo dnf -y groupinstall multimedia
sudo dnf -y install ffmpeg \
compat-ffmpeg \
gnome-mpv 
#gstreamer1-plugin-openh264 


#disabling COPR Repos
sudo dnf copr -y disable user501254/Paper
sudo dnf copr -y disable dirkdavidis/papirus-icon-theme

source install/common/flatpak.sh