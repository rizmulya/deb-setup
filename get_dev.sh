#!/bin/bash

install_vscode(){
  # https://code.visualstudio.com/
  wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -O vscode.deb && \
    dpkg -i vscode.deb
  apt install -f
}

install_anaconda(){
  # https://www.anaconda.com/download
  wget --content-disposition https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh && \
    chmod +x Anaconda3-2023.09-0-Linux-x86_64.sh && \
    ./Anaconda3-2023.09-0-Linux-x86_64.sh
  su $1
  conda config --set auto_activate_base false
  sudo su
  conda config --set auto_activate_base false
}

install_nodejs(){
  #https://github.com/nodesource/distributions#installation-instructions
  curl -fsSL https://deb.nodesource.com/setup_21.x | bash - &&\
    apt install nodejs && \
    node -v
}

install_mongodb(){
  # https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-debian/
  apt install gnupg curl
  curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | \
    sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg \
    --dearmor
  echo "deb [ signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] http://repo.mongodb.org/apt/debian bullseye/mongodb-org/7.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
  # https://packages.debian.org/buster/amd64/libssl1.1/download
  echo "deb http://security.debian.org/debian-security buster/updates main" >> /etc/apt/sources.list && \
    apt update && \
    apt install libssl1.1
  # apt install mongodb-org
  apt install -y mongodb-org=7.0.5 mongodb-org-database=7.0.5 mongodb-org-server=7.0.5 mongodb-mongosh=7.0.5 mongodb-org-mongos=7.0.5 mongodb-org-tools=7.0.5
  echo "mongodb-org hold" | sudo dpkg --set-selections
  echo "mongodb-org-database hold" | sudo dpkg --set-selections
  echo "mongodb-org-server hold" | sudo dpkg --set-selections
  echo "mongodb-mongosh hold" | sudo dpkg --set-selections
  echo "mongodb-org-mongos hold" | sudo dpkg --set-selections
  echo "mongodb-org-tools hold" | sudo dpkg --set-selections  
  # https://www.mongodb.com/try/download/shell
  wget --content-disposition https://downloads.mongodb.com/compass/mongodb-mongosh_2.1.3_amd64.deb && \
    dpkg -i mongodb-mongosh_2.1.3_amd64.deb
  apt install -f
  # https://www.mongodb.com/try/download/compass
  wget --content-disposition https://downloads.mongodb.com/compass/mongodb-compass_1.42.0_amd64.deb && \
    dpkg -i mongodb-compass_1.42.0_amd64.deb
  apt install -f
  # systemctl start mongod
  # mongosh && mongodb-compass
}

install_rust(){
  # https://www.rust-lang.org/tools/install
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  apt install libssl-dev
}

install_php(){
  apt install libapache2-mod-php php-mysql php-common
  chmod 777 /var/www/html -R
  apt install mariadb-server
  systemctl disable apache2
  systemctl disable mysql
  apt install phpmyadmin
  # mysql -u root -p
  # ALTER USER 'root'@'localhost' IDENTIFIED BY 'root';
  # GRANT ALL PRIVILEGES ON * . * TO 'root'@'localhost';
  # FLUSH PRIVILEGES;
}

install_virtualbox(){
  # https://www.virtualbox.org/wiki/Linux_Downloads
  wget https://download.virtualbox.org/virtualbox/7.0.14/virtualbox-7.0_7.0.14-161095~Debian~bookworm_amd64.deb -O virtualbox.deb && \
    dpkg -i virtualbox.deb
  apt install -f
  systemctl disable vboxautostart-service vboxballoonctrl-service vboxdrv vboxweb-service
  systemctl start vboxautostart-service vboxballoonctrl-service vboxdrv vboxweb-service
}

install_protonvpn(){
  # https://protonvpn.com/support/official-linux-vpn-debian/
  wget --content-disposition https://repo.protonvpn.com/debian/dists/stable/main/binary-all/protonvpn-stable-release_1.0.3-2_all.deb && \
    dpkg -i protonvpn-stable-release_1.0.3-2_all.deb && \
    apt install -f  && \
    apt update  && \
    apt install proton-vpn-gnome-desktop
}
