FROM php:7.4-apache

ARG apacheroot=$apacheroot
ENV APACHE_ROOT=$apacheroot

ARG WP_THEME_PATH=$WP_THEME_PATH
ENV WP_THEME_PATH=$WP_THEME_PATH

RUN apt-get update && apt-get install -y \
    bash \
    git \
    libzip-dev \
    zip \
    sendmail \
    && docker-php-ext-install zip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Uncomment only for the development environment
#RUN pecl install xdebug \
#    && docker-php-ext-enable xdebug \
#    && echo "xdebug.mode = debug,coverage" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.start_with_request = yes" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.discover_client_host = 1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
#    && echo "xdebug.client_host = host.docker.internal" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN a2enmod rewrite
RUN a2enmod alias
RUN a2enmod authz_core
RUN a2enmod autoindex
RUN a2enmod deflate
RUN a2enmod expires
RUN a2enmod filter
RUN a2enmod headers
RUN a2enmod setenvif


RUN sed -ri -e 's!/var/www/html!${APACHE_ROOT}!g' /etc/apache2/sites-available/*.conf
RUN sed -ri -e 's!/var/www/!${APACHE_ROOT}!g' /etc/apache2/apache2.conf /etc/apache2/conf-available/*.conf

RUN docker-php-ext-install mysqli
RUN docker-php-ext-install pdo_mysql
RUN docker-php-ext-install mysqli
RUN docker-php-ext-install opcache
RUN docker-php-ext-install pcntl
RUN docker-php-ext-install pdo

COPY --chown=www-data:www-data ./app ${APACHE_ROOT}
WORKDIR ${APACHE_ROOT}
RUN chsh -s /bin/bash www-data
