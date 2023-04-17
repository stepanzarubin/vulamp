#!/usr/bin/env bash

sudo add-apt-repository ppa:ondrej/php
sudo apt update

sudo apt-get -y install php8.1 php8.1-curl php8.1-gd php8.1-mcrypt php8.1-mysql php8.1-sqlite3 php8.1-imap php8.1-xml php8.1-mbstring php8.1-zip php8.1-intl php8.1-bz2
sudo cp /usr/lib/php/8.1/php.ini-development /etc/php/8.1/apache2/php.ini

sudo apt-get -y install libapache2-mod-php8.1

#enable modules
sudo phpenmod imap
