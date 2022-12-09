FROM debian:buster

RUN apt-get update -y && apt-get install -y nginx \
											openssl

RUN mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN	openssl req \
	-newkey rsa:4096 -nodes \
	-keyout /etc/ssl/private/inception.key \
	-x509 -days 365 \
	-out /etc/ssl/certs/inception.crt \
	-subj "/C=FR/ST=IDF/L=Paris/O=./OU=./CN=localhost/UID=amarchan"

RUN mkdir -p /var/run/nginx

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

# EXPOSE 443

# the daemon off directive will disable the #
# self-daemonizing behavior of nginx
CMD ["nginx", "-g", "daemon off;"]