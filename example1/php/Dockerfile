FROM php:5.6-apache

COPY php.ini /usr/local/etc/php/

COPY ping.php /var/www/html/

RUN apt-get update \
  && apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng-dev libmcrypt-dev iputils-ping \
  && docker-php-ext-install pdo_mysql mysqli gd iconv 
