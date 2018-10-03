echo "Updating System"
sudo dnf update -y

source $(dirname $0)/add-repo.sh

echo "Installing Softwares"
sudo dnf install -y gnome-tweaks \
code \
htop \
gcc-c++ \
make \
nodejs \
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
@virtualization \
util-linux-user \
zsh

# multimedia codecs
echo -e "\nInstalling Multimedia"
sudo dnf -y groupinstall multimedia
sudo dnf -y install ffmpeg \
compat-ffmpeg28 \
gnome-mpv  


#disabling COPR Repos
sudo dnf copr -y disable user501254/Paper
sudo dnf copr -y disable dirkdavidis/papirus-icon-theme