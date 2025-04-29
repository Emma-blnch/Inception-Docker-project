#!/bin/sh

CERT_PATH="/etc/nginx/ssl/inception.crt"
KEY_PATH="/etc/nginx/ssl/inception.key"

# Générer le certificat SSL uniquement s'il n'existe pas
if [ ! -f "$CERT_PATH" ] || [ ! -f "$KEY_PATH" ]; then
    echo "Génération du certificat SSL autosigné..."
    openssl req -x509 -nodes -newkey rsa:2048 -days 365 \
        -keyout "$KEY_PATH" \
        -out "$CERT_PATH" \
        -subj "/C=FR/ST=IDF/L=PARIS/O=42/CN=eblancha.42.fr"
fi

# Lancer nginx au premier plan (obligatoire pour PID 1)
echo "Démarrage de Nginx..."
exec nginx -g "daemon off;"
