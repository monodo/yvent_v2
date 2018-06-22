
FROM php:7.2-fpm
COPY nginx.conf /etc/nginx/nginx.conf
COPY docker/php.ini 	/usr/local/etc/php/conf.d/php.ini
RUN apt-get update -y && apt-get install -y zip unzip libpq-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-configure pgsql -with-pgsql=/usr/local/etc/pgsql
RUN docker-php-ext-install pdo pdo_pgsql pgsql sockets
RUN docker-php-ext-enable pdo pdo_pgsql pgsql sockets
WORKDIR /yvent-app
COPY . /yvent-app
RUN composer update --no-scripts
RUN composer install
EXPOSE 9002
