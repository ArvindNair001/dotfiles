if test $(which apt) then
    echo -e "updating system" 
    sudo apt update && apt upgrade
   
    echo -e "Adding 3rd party PPA's"
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
    sudo add-apt-repository -y ppa:alexlarsson/flatpak



    echo "installing Softwares"
    sudo apt install \
    ranger \
    synaptic \
    virtualbox-5.2 \
    zsh
fi