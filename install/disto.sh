#!/usr/bin/env bash

if [ "$(cat /etc/issue)" == "Arch Linux" ]; then
  echo "Running Arch Linux"
  source pacman.sh

elif [ -f  /etc/debian_version ]; then
  echo -e "Running Debain or Debian based distro"
  source deb.sh

elif [ -f /etc/fedora-release ]; then
  echo -e "Running Fedora"
  source fedora.sh
fi
