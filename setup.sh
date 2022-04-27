#!/bin/bash

HOME_DIR=$HOME
REPO_DIR="$HOME/git/i3-kde"
REPO_HOME_DIR="$REPO_DIR/home"

function _create_dir_if_not_exist() {
    local dir_path=$1
    if [[ -d $dir_path ]]; then 
        rm -rf $dir_path 
    fi
    mkdir -p $dir_path
}

function _setup_i3() {
    local i3_dir="$HOME/.config/i3"
    _create_dir_if_not_exist $i3_dir

    ln -s "$REPO_HOME_DIR/.config/i3/config" "$i3_dir/config"
}

_setup_i3