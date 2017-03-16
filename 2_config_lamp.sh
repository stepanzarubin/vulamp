#!/usr/bin/env bash

#apache
sudo cp /vulamp/config/apache/apache2.conf /etc/apache2/
sudo cp /vulamp/apache/mods-available/dir.conf /etc/apache2/mods-available/
sudo cp /vulamp/apache/mods-available/php7.0.conf /etc/apache2/mods-available/

#php 5.5
#sudo cp /vulamp/config/php/php5.5.ini /etc/php5/apache2/php.ini

#php 7.0
sudo cp /vulamp/config/php/php7.0.ini /etc/php/7.0/apache2/php.ini

#mariadb
sudo cp /vulamp/config/mariadb/my.cnf /etc/mysql/

sudo service apache2 restart
sudo service mysql restart
