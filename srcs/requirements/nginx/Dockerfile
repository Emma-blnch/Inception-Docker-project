FROM debian:bullseye

# Mise à jour du système et installation des paquets nécessaires (-y pour dire oui a toutes les questions sans bloquer)
RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl

# Création du dossier pour les certificats SSL
RUN mkdir -p /etc/nginx/ssl

# Copie de la configuration nginx
COPY conf/nginx.conf /etc/nginx/nginx.conf

# S'assurer que le dossier web existe (optionnel)
# RUN mkdir -p /var/www/html

# Copie du script de génération SSL
COPY tools/generate_ssl.sh /usr/local/bin/generate_ssl.sh
RUN chmod +x /usr/local/bin/generate_ssl.sh

EXPOSE 443

# Lancement du script au démarrage du container
CMD ["/usr/local/bin/generate_ssl.sh"]