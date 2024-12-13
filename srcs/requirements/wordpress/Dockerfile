FROM debian:bullseye

RUN apt update && apt install -y wget\
									php7.4\
									php-fpm\
									php-mysql\
									mariadb-client

RUN wget https://es.wordpress.org/wordpress-6.7-es_ES.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.7-es_ES.tar.gz && rm wordpress-6.7-es_ES.tar.gz
RUN chown -R root:root /var/www/wordpress

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
RUN mkdir /run/php

COPY ./tools/auto-config.sh /var/www/wordpress/
RUN chmod +x /var/www/wordpress/auto-config.sh

EXPOSE 9000

WORKDIR /var/www/wordpress

ENTRYPOINT [ "bash", "auto-config.sh" ]

