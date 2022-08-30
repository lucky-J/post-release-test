FROM php:7.4-cli

COPY ./index.php /var/www/

# Set default work directory
WORKDIR /var/www
