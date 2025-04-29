FROM debian:bullseye

# Mise à jour du système et installation des paquets nécessaires (-y pour dire oui a toutes les questions sans bloquer)
RUN apt update && apt upgrade -y && apt install -y nginx vim openssl

# Création du dossier pour les certificats SSL
RUN mkdir -p /etc/nginx/ssl

# Copie de la configuration nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# S'assurer que le dossier web existe
RUN mkdir -p /var/www/html

# S'assurer que les permissions sont correctes (main root et main user)
RUN chown -R www-data:www-data /var/www/html && chmod 755 /var/www/html

# Copie du script de génération SSL
COPY tools/generate_ssl.sh /usr/local/bin/generate_ssl.sh
RUN chmod +x /usr/local/bin/generate_ssl.sh

# Lancement du script au démarrage du container
CMD ["/usr/local/bin/generate_ssl.sh"]