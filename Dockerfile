FROM php:7.4-fpm

COPY --from=composer:1.10.12 /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y zip unzip wget

RUN docker-php-ext-install pdo pdo_mysql gd

COPY docker-entrypoint.sh /tmp

CMD [ "/tmp/docker-entrypoint.sh" ]