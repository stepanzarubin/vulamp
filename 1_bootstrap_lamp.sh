#!/usr/bin/env bash

#curl
sudo apt-get -y install curl

#for compiling/installing things
sudo apt-get -y install build-essential checkinstall software-properties-common

#ttf-mscorefonts-installer repository
sudo add-apt-repository -y multiverse

#mariadb-server repository
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://lon1.mirrors.digitalocean.com/mariadb/repo/10.1/ubuntu xenial main'

#php repository
sudo apt-get -y install language-pack-en-base
sudo LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php

#update
sudo apt-get update

### SOFTWARE ###

#microsoft fonts
sudo echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get -y install ttf-mscorefonts-installer

#apache
sudo apt-get -y install apache2 libapache2-mod-php

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
