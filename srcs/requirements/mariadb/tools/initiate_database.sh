#!/bin/sh
set -e

# service mysql start

if [ ! -d "/var/lib/mysql/${MYSQL_DATABASE}" ]; then
    echo "Initialisation de la base de donnees..."

    mysql_install_db --user=mysql --datadir=/var/lib/mysql
    mysqld_safe --skip-networking --user=mysql &
    pid="$!"

    # Attendre que le daemon MariaDB soit prêt à accepter les connexions (optionnel mais plus propre)
    until mysqladmin ping --silent; do
        sleep 1
    done

    mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
    mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_USER}\`@'%';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"

    mysqladmin -u root -p${MYSQL_ROOT_PASSWORD} shutdown

    wait "$pid"
fi

echo "Lancement de la base de données..."
exec mysqld_safe