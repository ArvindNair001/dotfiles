
# To install nvidia optimus drivers
sudo dnf config-manager --add-repo=https://negativo17.org/repos/fedora-nvidia.repo
sudo dnf install nvidia-driver kernel-devel akmod-nvidia dkms acpi
sudo dnf copr enable chenxiaolong/bumblebee
sudo dnf install akmod-bbswitch bumblebee primus
sudo gpasswd -a $USER bumblebee
sudo systemctl enable bumblebeed
sudo systemctl disable nvidia-fallback