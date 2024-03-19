#!/bin/bash

# your username
username="deb"

if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges."
    exit 1
fi

# setup
source get_setup.sh
first_setup "$username"
dev_shortcut "$username"
install_zsh "$username"

# general package
apt install curl
apt install wget
apt install net-tools
apt install brightnessctl
apt install gparted
apt install htop
apt install plocate
source get_gen.sh
install_brave
install_chrome
install_mega

# developer package
apt install python-is-python3 2to3 pip python3.11-venv
apt install git
apt install docker.io
apt install php
apt install composer
apt install npm
apt install swi-prolog
source get_dev.sh
install_vscode
install_anaconda "$username"
install_nodejs
install_mongodb
install_rust
install_php
install_virtualbox
# install_from_deb "asset/upwork_5.8.0.33_amd64.deb"

# more package
apt install tor torbrowser-launcher
apt install proxychains4
apt install wireshark
apt install aircrack-ng
apt install nmap
apt install john
install_protonvpn
# install_from_sh "assets/burpsuite_community_linux_v2023_12_1_3.sh"
