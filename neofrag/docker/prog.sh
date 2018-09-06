#!/bin/bash
SHELL=${1:-/bin/bash}

sudo -s cp /var/docker/conf/apache2.vhost /etc/apache2/sites-available/000-default.conf
sudo -s a2dismod mpm_event
sudo -s a2dismod mpm_prefork
sudo -s a2enmod rewrite
sudo -s  a2enmod php7.0
sudo /etc/init.d/apache2 start
sudo /etc/init.d/mysql start
sudo -s mysql < /var/docker/conf/init-table.mysql
sudo -s mysql -D neo < /var/www/html/DATABASE.sql
cp /var/docker/conf/db.php /var/www/html/config/db.php
cp /var/docker/conf/.htaccess /var/www/html/.htaccess 
sudo -s cp /var/docker/conf/apache2.conf /etc/apache2/apache2.conf
sudo -s chown -R www-data: /var/www/html/
sudo /etc/init.d/apache2 restart
sudo /etc/init.d/mysql restart
${SHELL}

