#!/bin/bash

install_brave(){
  # https://brave.com/linux
  curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list && \
    apt update && \
    apt install brave-browser
}

install_chrome(){
  # https://www.google.com/intl/id_id/chrome/
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb
  apt install -f
}

install_mega(){
  # https://mega.io/id/desktop#download
  wget https://mega.nz/linux/repo/Debian_12/amd64/megasync-Debian_12_amd64.deb && \
    dpkg -i megasync-Debian_12_amd64.deb
  apt install -f
}
