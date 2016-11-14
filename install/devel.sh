#!/usr/bin/env bash

#development tools
if [ "$(cat /etc/issue)" == "Arch Linux" ]; then
  echo "installing devel packages for Arch"
  if test ! $(which ruby); then
    sudo pacman -S --noconfirm ruby
  fi
  if test ! $(which gcc); then
    sudo pacman -S --noconfirm gcc
  fi
elif [ -f  /etc/debian_version ]; then
  echo -e "Running Debain or Debian based distro"
  echo "installing devel packages"
  sudo apt-get update
  if test ! $(which ruby); then
    echo "installin ruby"
    sudo apt-get install ruby
  fi
  if test ! $(which gcc); then
    echo "installing gcc"
    sudo apt-get install gcc
  fi
  # elif [ -f /etc/redhat-release ]; then
  #   if test ! $(which ruby); then
  #     yum
fi
