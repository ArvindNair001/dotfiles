echo -e "Enabling RPM Fusion"
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#echo "Adding virtualbox repo"
#sudo rpm --import https://www.virtualbox.org/download/oracle_vbox.asc
#sudo sh -c 'echo -e "[virtualbox]\nname=Fedora \$releasever - \$basearch - VirtualBox\nbaseurl=http://download.virtualbox.org/virtualbox/rpm/fedora/\$releasever/\$basearch\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://www.virtualbox.org/download/oracle_vbox.asc" > /etc/yum.repos.d/virtualbox.repo'


echo "Adding visual studio code repo"
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'

echo "Enabling copr repos"
sudo dnf copr -y enable user501254/Paper
sudo dnf copr -y enable dirkdavidis/papirus-icon-theme