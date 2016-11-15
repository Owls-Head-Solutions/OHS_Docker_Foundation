FROM php:7.0.6-fpm

# required libs for extensions
RUN apt-get update && apt-get install -y \
        build-essential wget libmemcached-dev \
        zlib1g-dev libpng12-dev less \
    && rm -rf /var/lib/apt/lists/*

RUN echo '' | pecl install oauth
RUN echo "extension=oauth.so" > /usr/local/etc/php/conf.d/ext-oauth.ini

# xdebug extension
RUN pecl install xdebug
COPY ext-xdebug.ini /usr/local/etc/php/conf.d/ext-xdebug.ini

RUN apt-get update && \
    apt-get install -y \
        libmcrypt-dev

RUN docker-php-ext-install mbstring \
    && docker-php-ext-install gd \
    && docker-php-ext-install exif \
    && docker-php-ext-install gettext \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install opcache \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install pdo_mysql

# WP CLI
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp