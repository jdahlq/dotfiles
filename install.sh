#! /bin/bash

set -ux

# # Install Starship:
# # Mac: brew install cmake
# # Ubuntu: apt install cmake
# cargo install starship --locked

# Git
cp .gitconfig ~/

# ZSH & Oh-My-ZSH
cp .zshrc ~/

# Kitty Terminal
cp kitty.conf ~/.config/kitty/

# Emacs
cp .emacs.d/init.el ~/.emacs.d/

# Starship
cp starship.toml ~/.config/starship.toml
