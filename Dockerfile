FROM php:7.4-fpm

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && \
    apt-get install -y \
    zip \
    unzip \
    wget \
    libpng-dev \
    libjpeg-dev \
    zlib1g-dev 

RUN docker-php-ext-configure gd --enable-gd --with-jpeg

RUN docker-php-ext-install pdo pdo_mysql gd

# COPY docker-entrypoint.sh /tmp

# CMD [ "/tmp/docker-entrypoint.sh" ]