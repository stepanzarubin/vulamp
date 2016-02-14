#!/usr/bin/env bash
sudo cp /vulamp/config/apache/apache2.conf /etc/apache2/
sudo cp /vulamp/config/php/php.ini /etc/php5/apache2/
sudo cp /vulamp/config/mariadb/my.cnf /etc/mysql/

sudo service apache2 restart
sudo service mysql restart
