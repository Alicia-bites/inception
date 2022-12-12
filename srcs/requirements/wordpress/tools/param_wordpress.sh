#!bin/bash

# Description : a script to configure Wordpress 

#Colors
RESET='\033[0m'
DODGERBLUE1="\033[38;5;33m"
ORANGERED1="\033[38;5;202m"
SPRINGGREEN5="\033[38;5;41m"
GREENYELLOW="\033[38;5;154m"
DEEPPINK6="\033[38;5;125m"
DARKSLATEGRAY2="\033[38;5;87m"
CHARTREUSE6="\033[38;5;64m"
SLATEBLUE1="\033[38;5;99m"

#waiting a bit for MariaDB to be launched
sleep 7

# config wordpress if it hasn't been done already
if [ ! -e /var/www/wordpress/wp-config.php ]; then
    wp config create	--allow-root \
						--dbname=$SQL_DATABASE \ 
						--dbuser=$SQL_USER \
						--dbpass=$SQL_PASSWORD \
    					--dbhost=mariadb:3306 \
						--path='/var/www/wordpress'

sleep 3
wp core install	--url=$DOMAIN_NAME \
				--title=$SITE_TITLE \
				--admin_user=$ADMIN_USER \
				--admin_password=$ADMIN_PASSWORD \
				--admin_email=$ADMIN_EMAIL \
				--allow-root \
				--path='/var/www/wordpress'

wp user create	--allow-root \
				--role=author $USER1_LOGIN $USER1_MAIL \
				--user_pass=$USER1_PASS \
				--path='/var/www/wordpress' >> /log.txt
fi

if [ ! -d /run/php ]; then
    mkdir ./run/php
fi
/usr/sbin/php-fpm7.3 -F