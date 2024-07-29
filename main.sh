#!/bin/bash

# your username
username="deb"
#

if [[ $EUID -ne 0 ]]; then
    echo "This script requires root privileges."
    exit 1
fi
source shortcommand.sh

# setup
first_setup "$username"
dev_shortcut "$username"

install_zsh "$username"
shell_default="zsh"
shell_config=".zshrc"


# general package
apt install curl
apt install wget
apt install net-tools
apt install brightnessctl
apt install gparted
apt install htop
apt install plocate
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
install_vscode
install_anaconda "$username" "$shell_default"
install_nodejs
install_mongodb
install_golang "$username" "$shell_config" 
install_rust
install_php
install_java
install_flutter "$username" "/home/$username/Desktop" "$shell_config"
install_virtualbox

# more package
apt install tor torbrowser-launcher
apt install proxychains4
apt install wireshark
apt install aircrack-ng
apt install nmap
apt install john
install_protonvpn
