echo "Updating the package manager"
sudo dnf update -y
echo "installing fedy"
sudo sh -c 'curl https://www.folkswithhats.org/installer | bash'

echo "installing some tools"
sudo dnf install -y yumex-dnf \
gnome-tweak-tool \
leafpad \
transmission

echo "Installing zsh"
dnf install -y zsh
