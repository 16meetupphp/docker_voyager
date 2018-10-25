
while ! nc -z $DB_HOST $DB_PORT;
do
  echo 'Waiting for database to be ready';
  sleep 1;
done;
cd /var/www/ && composer require tcg/voyager
#!/bin/sh
if [ ! -e "/var/www/composer.lock" ]
then
    cd /var/www/ && composer update
fi
cd /var/www/ && chmod -R 777 storage
cd /var/www/ && php artisan voyager:install --with-dummy 
php-fpm
