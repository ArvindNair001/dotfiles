# Configuring SSH
user=$(logname)
location="/home/$user/.ssh"

echo "Generating SSH Keys"
mkdir  -vp $location
ssh-keygen -t rsa -b 4096
chmod +600 $location
chmod +700 "$location/*"
