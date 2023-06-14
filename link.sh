#!/bin/bash

set -ue

# Start in the dir where the script resides.
script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$script_path"

STYLE='\x1B[1;32m'
NOSTYLE='\x1B[0m'

function echo_heading() {
    echo -e "\n$STYLE*** $1 ***$NOSTYLE"
}

function make_link() {
    ln -siv $script_path/$1 ~/$1
}

echo_heading "Creating symlinks from $script_path/ to $HOME/"

echo_heading "Git"
make_link .gitconfig

echo_heading "ZSH"
make_link .zshrc

echo_heading "Kitty Terminal"
make_link .config/kitty/kitty.conf

echo_heading "Emacs"
make_link .emacs.d/init.el

echo_heading "Starship"
make_link .config/starship.toml
