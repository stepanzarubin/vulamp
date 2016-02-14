#!/usr/bin/env bash

#for compiling/installing things
sudo apt-get install build-essential checkinstall software-properties-common

#ttf-mscorefonts-installer repository
sudo add-apt-repository multiverse

#mariadb-server repository
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb [arch=amd64,i386] http://mirrors.fe.up.pt/pub/mariadb/repo/10.1/ubuntu trusty main'

#update
sudo apt-get update

### SOFTWARE ###

#microsoft fonts
sudo echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get -y install ttf-mscorefonts-installer

#apache
sudo apt-get -y install apache2

#php
sudo apt-get -y install php5 php5-curl php5-gd php5-mcrypt php5-mysql php5-imap php5-json php5-intl
sudo cp /usr/share/php5/php.ini-development /etc/php5/apache2/php.ini

#enable modules
sudo php5enmod imap

#composer
curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer

#phpunit (optional since can be installed via composer)
#latest version require at least php 5.6
#curl -O https://phar.phpunit.de/phpunit.phar
#using previous stable release
curl -o phpunit.phar https://phar.phpunit.de/phpunit-old.phar
chmod +x phpunit.phar
sudo mv phpunit.phar /usr/local/bin/phpunit

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
sudo service apache2 start
#start on boot
sudo update-rc.d -f apache2 remove
sudo update-rc.d apache2 defaults

#vim
cp /vulamp/config/vim/.vimrc ~/.vimrc
sudo cp /vulamp/config/vim/.vimrc /root/.vimrc

#ncdu
sudo apt-get -y install ncdu

#upgrade
sudo apt-get -y upgrade
echo "Finish"
### END ###