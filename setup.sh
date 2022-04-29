#!/bin/bash

HOME_DIR=$HOME
REPO_DIR="$HOME_DIR/git/i3-kde"
REPO_HOME_DIR="$REPO_DIR/home"
REPO_USR_DIR="$REPO_DIR/usr"

function _create_dir() {
    local dir_path=$1
    if [[ -d $dir_path ]]; then 
        rm -rf $dir_path 
    fi
    mkdir -p $dir_path
}

function _install_packages() {
    sudo pacman -S i3-gaps rofi feh picom
}

function _setup_i3() {
    local i3_dir="$HOME_DIR/.config/i3"
    _create_dir $i3_dir

    ln -s "$REPO_HOME_DIR/.config/i3/config" "$i3_dir/config"
}

function _setup_picom() {
    local picom_dir="$HOME_DIR/.config/picom"
    _create_dir $picom_dir

    ln -s "$REPO_HOME_DIR/.config/picom/picom.conf" "$picom_dir/picom.conf"
}

function _setup_rofi() {
    local rofi_dir="$HOME_DIR/.config/rofi" 
    _create_dir $rofi_dir

    ln -s "$REPO_HOME_DIR/.config/rofi/config.rasi" "$rofi_dir/config.rasi" 
    ln -s "$REPO_HOME_DIR/.config/rofi/nord.rasi" "$rofi_dir/nord.rasi" 
}

function _setup_fonts() {
    cp -r "$REPO_HOME_DIR/.fonts/." "$HOME_DIR/.fonts"
}

function _setup_local() {
    cp -r "$REPO_HOME_DIR/.local/." "$HOME_DIR/.local"
}

function _setup_antigen() {
    local antigen_dir="$HOME_DIR/antigen"
    if [[ -d $antigen_dir ]]; then 
        rm -rf $antigen_dir 
    fi
    git clone git@github.com:zsh-users/antigen.git $antigen_dir
}

function _setup_desktopsession() {
    sudo cp -r "$REPO_USR_DIR/." "/usr"
}

function _setup_home_dots() {
    cp "$REPO_HOME_DIR/.imwheelrc" $HOME_DIR
}

function _setup_programs() {
    cp -r "$REPO_HOME_DIR/programs/." "$HOME_DIR/programs/"
}

_install_packages
_setup_desktopsession
_setup_i3
_setup_picom
_setup_fonts
_setup_local
_setup_antigen
_setup_home_dots
_setup_programs
_setup_rofi