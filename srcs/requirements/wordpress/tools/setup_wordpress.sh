#!/bin/sh
set -e

# le temps que mariadb soit prêt
sleep 10

# if [ ! -f /var/www/wordpress/wp-config.php ]; then
#     echo "Création du fichier wp-config.php..."

#     cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

#     sed -i "s/database_name_here/${MYSQL_DATABASE}/" /var/www/wordpress/wp-config.php
#     sed -i "s/username_here/${MYSQL_USER}/" /var/www/wordpress/wp-config.php
#     sed -i "s/password_here/${MYSQL_PASSWORD}/" /var/www/wordpress/wp-config.php
#     sed -i "s/localhost/${MYSQL_HOSTNAME}/" /var/www/wordpress/wp-config.php

#     # Remplissage rapide des salts avec des chaînes aléatoires
#     for salt in AUTH_KEY SECURE_AUTH_KEY LOGGED_IN_KEY NONCE_KEY AUTH_SALT SECURE_AUTH_SALT LOGGED_IN_SALT NONCE_SALT
#     do
#         RANDOM_KEY=$(openssl rand -base64 32)
#         sed -i "s/define('$salt',.*);/define('$salt', '${RANDOM_KEY}');/" /var/www/wordpress/wp-config.php
#     done
# fi
if [ ! -f /var/www/wordpress/wp-config.php ]; then
    echo "Création du fichier wp-config.php..."

    wp config create \
        --dbname=$MYSQL_DATABASE \
        --dbuser=$MYSQL_USER \
        --dbpass=$MYSQL_PASSWORD \
        --dbhost=$MYSQL_HOSTNAME \
        --path=/var/www/wordpress \
        --allow-root

    wp config shuffle-salts --path=/var/www/wordpress --allow-root

fi

chown -R www-data:www-data /var/www/wordpress

echo "Lancement de PHP-FPM..."
exec php-fpm -F