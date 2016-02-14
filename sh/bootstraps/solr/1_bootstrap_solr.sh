#!/usr/bin/env bash
#bootstrap Solr
sudo apt-get update
sudo apt-get -y install openjdk-7-jdk

sudo service apache2 stop

sudo apt-get -y install php5-dev php-pear libcurl4-gnutls-dev libxml2 libxml2-dev libpcre3-dev
yes '' | sudo pecl install solr
sudo bash -c 'echo "extension=solr.so" > /etc/php5/mods-available/solr.ini'
sudo ln -s ../../mods-available/solr.ini /etc/php5/apache2/conf.d/20-solr.ini
sudo ln -s ../../mods-available/solr.ini /etc/php5/cli/conf.d/20-solr.ini

sudo service apache2 start
