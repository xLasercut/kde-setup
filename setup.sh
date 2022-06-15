#!/bin/bash

export ADD_EXECUTABLE=1
export ADD_VM_FIXES=1
export ADD_LOCALS=1
export ADD_THEMES=1
export ADD_FONTS=1

# setup submodules
git submodule init
git submodule update

# setup home config
pushd ./linux-home-config
./setup.sh
popd

# set kde max windows no border
echo "[Windows]" >> ~/.config/kwinrc
echo "BorderlessMaximizedWindows=true" >> ~/.config/kwinrc

# copy pacman cache
sudo cp ./pacman/98-clear-paccache.hook /etc/pacman.d/hooks/

# update system
sudo pacman -Syyu
sudo pacman -S vim plasma5-applets-window-buttons gufw zsh imwheel

# change shell
chsh -s /bin/zsh
