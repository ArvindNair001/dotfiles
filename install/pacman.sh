#!/bin/sh

if test $(which pacman); then
    echo "updating packages"
    echo "$(sudo pacman -Sy && pacman -Syu)"
    if test ! $(which yaourt); then
      sudo pacman -S --noconfirm yaourt
    fi

    #CLI tools
    sudo pacman -S wget
    sudo pacman -S curl
    # tree

    #development tools



fi
mv /etc/pacman.d/pacman.conf ~/sysconfback
cp repo/pacman.conf /etc/pacman.d/pacman.conf
