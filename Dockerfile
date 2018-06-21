
FROM php:7.2
RUN apt-get update -y && apt-get install -y openssl zip unzip git libpq-dev apache2
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo pdo_pgsql pgsql sockets 
RUN a2enmod rewrite
WORKDIR /app
COPY . /app
RUN composer update --no-scripts 
RUN composer install
EXPOSE 9001