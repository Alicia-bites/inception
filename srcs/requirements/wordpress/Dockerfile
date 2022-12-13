FROM debian:buster

RUN apt-get update && apt-get upgrade -y

# php, installe ici comme le demande le sujet
RUN apt-get install -y php7.3\
	# (pour fastCGI)
	php-fpm \
	# (pour la database)
	php-mysql \
	mariadb-client 

# on a besoin de wget pour recup le lien d'installation de wordpress
RUN apt-get -y install wget
# installattion de wordpress
RUN wget https://wordpress.org/wordpress-6.1.1.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.1.1.tar.gz && rm wordpress-6.1.1.tar.gz

COPY ./conf/php.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN chown -R root:root /var/www/wordpress

# CLI
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY /tools/param_wordpress.sh param_wordpress.sh

ENTRYPOINT ["bash", "param_wordpress.sh"]