FROM ubuntu
MAINTAINER lishulei <shulei.lee@gmail.com>

RUN apt-get update && \
    apt-get -y upgrade

RUN apt-get -y install php5-cli php5-fpm php5-mysql php5-mcrypt curl 

RUN sed -i '/daemonize /c \
daemonize = no' /etc/php5/fpm/php-fpm.conf

RUN sed -i '/^listen /c \
listen = 0.0.0.0:9000' /etc/php5/fpm/pool.d/www.conf

RUN php5enmod mcrypt

RUN mkdir -p /var/log/php5

RUN echo 'error_log = /var/log/php5/php5-fpm.log' >> /etc/php5/fpm/php.ini

RUN echo 'error_log = /var/log/php5/php5-cli.log' >> /etc/php5/cli/php.ini

RUN sed -i 's/^listen.allowed_clients/;listen.allowed_clients/' /etc/php5/fpm/pool.d/www.conf

RUN mkdir -p /data/web && \
    chown -R www-data:www-data /data/web

RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer
RUN composer self-update

VOLUME ["/data/web", "/var/log/php"]

EXPOSE 9000

ENTRYPOINT ["php5-fpm"]
