FROM wordpress

MAINTAINER hery <hery1923@gmail.com>

WORKDIR /var/www/html

COPY wp-config.php .

EXPOSE 80
