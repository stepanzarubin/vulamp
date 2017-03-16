#!/usr/bin/env bash

#curl
sudo apt-get -y install curl

#for compiling/installing things
sudo apt-get -y install build-essential checkinstall software-properties-common

#mariadb-server repository
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.cc.uoc.gr/mirrors/mariadb/repo/10.0/ubuntu trusty main'

#php repository
sudo apt-get -y install language-pack-en-base
sudo LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

#update
sudo apt-get update

### SOFTWARE ###

#apache
sudo apt-get -y install apache2 libapache2-mod-php7.0

#php 7.0
/vulamp/sh/bootstraps/php/7.0.sh

#composer
#/vulamp/sh/bootstraps/php/composer.sh

#phpunit
#/vulamp/sh/bootstraps/php/phpunit.sh

#mariadb
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
sudo apt-get -y install mariadb-server

#mariadb config
sudo mysql -uroot -proot -e "source /vulamp/config/mariadb/sql/config.sql;"

### BASIC CONFIG ###

#apache
#create logs directory
sudo mkdir /etc/apache2/logs/
#create ssl directory
sudo mkdir /etc/apache2/ssl/

#enable rewrite, ssl mods
sudo service apache2 stop
sudo a2enmod rewrite
sudo a2enmod ssl

#user public_html directory (allows to keep all websites under ~/public_html/)
mkdir ~/public_html
sudo a2enmod userdir
sudo usermod -a -G `whoami` www-data
##end

sudo service apache2 start
#start on boot
sudo update-rc.d -f apache2 remove
sudo update-rc.d apache2 defaults

#vim
cp /vulamp/config/vim/.vimrc ~/.vimrc;
sudo cp /vulamp/config/vim/.vimrc /root/.vimrc

#ncdu
sudo apt-get -y install ncdu

#cleanup
sudo apt-get -y autoremove

#upgrade
sudo apt-get -y upgrade
echo "Finish"
### END ###
