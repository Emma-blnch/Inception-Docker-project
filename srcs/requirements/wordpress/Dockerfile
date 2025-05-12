FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y wget\
    php php-fpm php-mysql php-curl php-mbstring php-xml php-gd php-zip\
    mariadb-client &&\
    ln -s /usr/sbin/php-fpm7.4 /usr/sbin/php-fpm &&\
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN wget https://wordpress.org/latest.tar.gz -P /var/www &&\
    cd /var/www && tar -xzf latest.tar.gz && rm latest.tar.gz

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp
# installer version 6.8.1 manuellement
RUN sed -i "s|listen = .*|listen = 9000|" /etc/php/*/fpm/pool.d/www.conf

COPY tools/setup_wordpress.sh /usr/local/bin/setup_wordpress.sh
RUN chmod +x /usr/local/bin/setup_wordpress.sh

RUN chown -R www-data:www-data /var/www/wordpress

RUN mkdir -p /run/php

CMD ["/usr/local/bin/setup_wordpress.sh"]