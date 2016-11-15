FROM debian:jessie
MAINTAINER Scott Rackliff <scottr@owlsheadsolutions.com>

CMD ["/docker_tools/apache_startup.sh"]

RUN apt-get -y update && \
    apt-get -y install \
    locales-all \
    build-essential \
    apache2 \
    php5-dev \
    libssl-dev \
    libapache2-mod-php5 \
    php-pear \
    php5-common \
    php5-odbc \
    php5-xsl \
    php5-json \
    php5-curl \
    php5-mcrypt \
    swftools \
    vim \
    curl \
    php5-xdebug \
    phpunit \
    nodejs \
    npm

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/*

# update node to LTS 4.5.0 (node is needed for TAPE unit testing)
RUN npm cache clean -f && \
    npm install -g n && \
    n lts

RUN npm install tape --save-dev
RUN npm install request --save-dev
RUN npm install -g browserify

# Configure PHP
RUN pear install XML_Serializer-0.20.2
RUN php5enmod xsl json curl mcrypt odbc

# Configure Apache
ADD dockerfiles/000-default.conf /etc/apache2/sites-available
RUN a2ensite 000-default
RUN a2enmod php5 speling status rewrite


# xdebug settings
RUN echo "xdebug.enable=1"  >> /etc/php5/apache2/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_enable=1"  >> /etc/php5/apache2/conf.d/20-xdebug.ini
RUN echo "xdebug.remote_port=9000"  >> /etc/php5/apache2/conf.d/20-xdebug.ini
RUN echo 'xdebug.remote_host=${HOSTIP}'  >> /etc/php5/apache2/conf.d/20-xdebug.ini

RUN chown -R www-data: /var/www
RUN mkdir -p /docker_tools
COPY dockerfiles/apache_startup.sh /docker_tools/apache_startup.sh
COPY dockerfiles/apache2.conf /etc/apache2/apache2.conf
COPY scripts /docker_tools/scripts
RUN chmod -R +rx /var/www /docker_tools/apache_startup.sh