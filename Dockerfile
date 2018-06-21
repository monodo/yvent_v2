
FROM php:7.2-apache-stretch
# COPY ./ /var/www/vhosts/yverdon-geoportail/private/yvent/
# COPY ./apache/ /usr/local/apache2/conf/httpd.conf
COPY nginx.conf /etc/nginx/nginx.conf
RUN apt-get update -y && apt-get install -y openssl zip unzip git libpq-dev
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN docker-php-ext-install pdo pdo_pgsql pgsql sockets 
WORKDIR /app
COPY . /app
#RUN composer update --no-scripts 
RUN composer install
EXPOSE 9001