#!/bin/sh
service apache2 restart
a2enmod proxy
a2enmod proxy_http
a2enmod rewrite 
a2ensite project.conf
service apache2 restart
cd /home/sites/www.project.org #pushd not found
composer install
# php app/console braincrafted:bootstrap:generate
# php app/console braincrafted:bootstrap:install
php bin/console assetic:dump
php bin/console assets:install web --symlink
chmod -R 777 /home/sites/www.project.org/var/cache/ /home/sites/www.project.org/var/logs/
mysql -u root -h project_mysql -proot project < /docker/mysql/database.sql
ping localhost
# php app/console server:run
