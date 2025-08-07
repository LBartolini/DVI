FROM php:8.2-apache

RUN apt-get update -qq && apt-get install -y iputils-ping iproute2

RUN a2enmod rewrite

COPY . /var/www/html/

RUN chmod -R 777 /var/www/html/passwords

