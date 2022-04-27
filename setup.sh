#!/bin/bash

HOME_DIR=$HOME
REPO_DIR="$HOME_DIR/git/i3-kde"
REPO_HOME_DIR="$REPO_DIR/home"

function _create_dir() {
    local dir_path=$1
    if [[ -d $dir_path ]]; then 
        rm -rf $dir_path 
    fi
    mkdir -p $dir_path
}

function _install_packages() {
    sudo pacman -S i3-gaps rofi picom feh
}

function _setup_i3() {
    local i3_dir="$HOME_DIR/.config/i3"
    _create_dir $i3_dir

    ln -s "$REPO_HOME_DIR/.config/i3/config" "$i3_dir/config"
}

function _setup_fonts() {
    local fonts_dir="$HOME_DIR/.fonts"
    cp -r "$REPO_HOME_DIR/.fonts/." $fonts_dir
}

function _setup_local() {
    local locals_dir="$HOME_DIR/.local"
    cp -r "$REPO_HOME_DIR/.local/" $locals_dir
}

function _setup_antigen() {
    local antigen_dir="$HOME_DIR/antigen"
    if [[ -d $antigen_dir ]]; then 
        rm -rf $antigen_dir 
    fi
    git clone git@github.com:zsh-users/antigen.git $antigen_dir
}

_setup_i3
_setup_fonts
_setup_local
_setup_antigen