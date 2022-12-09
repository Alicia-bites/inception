#!/bin/bash
 # description : #openSSL config 
 # to enable HTTPS connections on nginx server

 #Colors
RESET='\033[0m'
DODGERBLUE1="\033[38;5;33m"

if [ ! -f /etc/ssl/certs/nginx.crt ]; then
echo "$DODGERBLUE1 Nginx: creating pair of RSA keys and self-signed certificate...";
	openssl req \
	-newkey rsa:2048 -nodes \
	-keyout /etc/nginx/ssl/my_inception.key \
	-x509 -days 365 \
	-out /etc/nginx/ssl/my_inception.crt \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=amarchan.42.fr/UID=amarchan";
echo "Nginx: ssl is set up!$RESET";
fi

exec "$@"