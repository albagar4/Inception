#!/bin/sh

sleep 10
if [ -f /var/www/wordpress/wp-config.php ]
then
	echo "wp-config.php already exists"
else
	echo "prev config create"
	wp config create \
		--allow-root \
		--dbname="$SQL_DATABASE" \
		--dbuser="$SQL_USER" \
		--dbpass="$SQL_PASSWORD" \
		--dbhost="mariadb" \
		--path="/var/www/wordpress"
	
	echo "prev core install"
	wp core install \
        --allow-root \
        --url="$WP_URL" \
        --title="$WP_TITLE" \
        --admin_user="$WP_ADMIN_USER" \
        --admin_password="$WP_ADMIN_PASSWORD" \
        --admin_email="$WP_ADMIN_EMAIL" \
        --path="/var/www/wordpress"

	echo "prev user create"
	wp user create \
		--allow-root \
		$WP_USER \
		$WP_USER_EMAIL \
		--role=author \
		--user_pass=$WP_USER_PASSWORD \
		--path='/var/www/wordpress'

    chown -R www-data:www-data /var/www/wordpress
    chmod -R 755 /var/www/wordpress

    echo "WordPress has been successfully installed and configured."
fi

php-fpm7.4 -F
