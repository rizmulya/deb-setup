#!/bin/bash

first_setup(){
  su - && \
    echo "$1 ALL=(ALL:ALL) ALL" >> /etc/sudoers && \
    usermod -a -G sudo $1

  echo "deb http://ftp.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list && \
    apt update
}

dev_shortcut(){
  echo "file:///home/$1/Dev" >> /home/$1/.config/gtk-3.0/bookmarks
}

install_zsh(){
  apt install zsh && \
    zsh && \
    chsh -s /bin/bash $1 && \
    su - && \
    chsh -s /bin/bash root

  su $1 && \
    cp assets/.zshrc ~
  sudo su && \
    cp assets/.zshrc ~
    cp assets/zsh/* /usr/share -r
}

install_from_sh(){
  chmod +x $1 && \
    ./$1
}

install_from_deb(){
  dpkg -i $1
  apt install -f
}
