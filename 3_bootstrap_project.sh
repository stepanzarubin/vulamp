#!/usr/bin/env bash
##### Project #####
#time
sudo echo "America/New_York" | sudo tee /etc/timezone
sudo dpkg-reconfigure --frontend noninteractive tzdata

#ntp
sudo apt-get -y install ntp

#cron
sudo restart cron

### APACHE VHOST ###
#create ssl folder
sudo mkdir -p /etc/apache2/ssl/vg.project
#create logs folder
sudo mkdir -p /etc/apache2/logs/vg.project

#ssl certificate
sudo cp /vulamp/ssl/vg.project/apache.crt /etc/apache2/ssl/vg.project/
sudo cp /vulamp/ssl/vg.project/apache.key /etc/apache2/ssl/vg.project/

#vhost
sudo cp /vulamp/vhost/vg.project/vg.project.conf /etc/apache2/sites-available/

#disable default host
sudo a2dissite 000-default.conf
#enable project host
sudo a2ensite vg.project.conf
#apply changes
sudo service apache2 restart
