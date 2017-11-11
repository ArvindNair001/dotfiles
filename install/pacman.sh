#!/bin/sh

if test $(which pacman); then
    echo "updating packages"
    sudo pacman -Sy && pacman -Syu
    #if test ! $(which yaourt); then
    #  sudo pacman -S --noconfirm yaourt
    #fi
    if test ! $(which gcc); then
      sudo pacman -S --noconfirm gcc
    fi

    sudo pacman -S --noconfirm wget \
    chromium \
    firefox \
    curl \
    git \
    vim \
    tmux \
    zsh
    


fi
# mv /etc/pacman.d/pacman.conf ~/sysconfback
# cp repo/pacman.conf /etc/pacman.d/pacman.conf
