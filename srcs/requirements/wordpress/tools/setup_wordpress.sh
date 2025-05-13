#!/bin/sh
set -e

# le temps que mariadb soit prêt
sleep 10

# Télécharger WordPress si nécessaire
if [ ! -d /var/www/wordpress/wp-includes ]; then
    echo "Téléchargement WordPress 6.8.1..."
    wp core download --version=6.8.1 --path=/var/www/wordpress --force --allow-root
fi

wp theme install twentytwentyfour --path=/var/www/wordpress --allow-root

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

    wp language core install fr_FR --path=/var/www/wordpress --allow-root
    wp language core activate fr_FR --path=/var/www/wordpress --allow-root

    wp core install \
    --url="https://${DOMAIN_NAME}" \
    --title="Mon site WordPress" \
    --admin_user="${WP_ADMIN_USER}" \
    --admin_password="${WP_ADMIN_PASSWORD}" \
    --admin_email="${WP_ADMIN_EMAIL}" \
    --path=/var/www/wordpress \
    --skip-email \
    --allow-root

    wp theme install twentytwentyfour --activate --path=/var/www/wordpress --allow-root

    # créer un second utilisateur classique
    wp user create "${WP_USER}" "${WP_USER}@example.com" \
        --user_pass="${WP_PASSWORD}" \
        --role=author \
        --path=/var/www/wordpress \
        --allow-root

fi

chown -R www-data:www-data /var/www/wordpress

echo "Lancement de PHP-FPM..."
exec php-fpm -F