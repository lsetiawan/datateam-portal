FROM php:5.6-apache

ENV WEBDIR /var/www/html/

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod +x /usr/local/bin/install-php-extensions && sync

RUN apt update && \
    apt install --yes \
    wget \
    curl \
    zip \
    unzip

RUN install-php-extensions intl mysql pdo_mysql

COPY . ${WEBDIR}

WORKDIR ${WEBDIR}

RUN wget https://getcomposer.org/download/latest-stable/composer.phar 
RUN chmod +x composer.phar
RUN ./composer.phar update && ./composer.phar install -n
RUN a2enmod rewrite

