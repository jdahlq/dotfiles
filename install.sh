#!/bin/bash

set -ue

# Start in the dir where the script resides.
script_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$script_path"

# Determine the distro
# Here are some known OSes:
# - On Mac: Darwin
# - On FreeBSD or GhostBSD: FreeBSD
# - On Fedora: fedora
# - On Ubuntu: ubuntu
# - On Raspbian: raspbian
function get_distro() {
    if [[ -f /etc/os-release ]]
    then
        # On Linux systems
        source /etc/os-release
        echo $ID
    else
        # On systems other than Linux (e.g. Mac or FreeBSD)
        uname
    fi
}

STYLE='\x1B[1;32m'
NOSTYLE='\x1B[0m'

function echo_heading() {
    echo -e "\n\n$STYLE***$1***$NOSTYLE"
}

set -uex

# Install software based on OS
case $(get_distro) in
    ubuntu)
	echo_heading "OS Detected: Ubuntu."
	sudo apt update

	echo_heading "Installing cmake (needed for Starship install)"
	sudo apt install cmake
        ;;
    Darwin)
        echo_heading "OS Detected: MacOS."
	brew update

 	echo_heading "Installing cmake (needed for Starship install)"
	brew install cmake
        ;;
esac

# Install OS-agnostic software

echo_heading "Installing Eza (modern ls, maintained exa)"
cargo install eza

echo_heading "Installing Starship (shell prompt for ZSH)"
cargo install starship --locked

echo_heading "Installing/Updating NVM (Nodejs Version Mananger)"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.zshrc
nvm install 20

echo_heading "Installing/Updating CowSay (Ascii Art thingy)"
npm install -g cowsay
