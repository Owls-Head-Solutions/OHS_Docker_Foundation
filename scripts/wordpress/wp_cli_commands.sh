#!/usr/bin/env bash

#setup variable values
DB_NAME="WP_Foundation"
DB_USER_NAME="WP_User"
DB_PASS="OHSWPFoundationPW"

WP_TITLE="WPFoundation"
WP_USER="admin"
WP_USER_PASS="admin"
WP_USER_EMAIL="admin@admin.com"
WP_IP="192.168.99.100"

wp core download --allow-root
wp core config --allow-root --path='/var/www/html' --dbhost="mysql" --dbname=${DB_NAME} --dbuser=${DB_USER_NAME} --dbpass=${DB_PASS} --skip-check
wp core install --allow-root --url=http://${WP_IP} --title=${WP_TITLE} --admin_user=${WP_USER} --admin_password=${WP_USER_PASS} --admin_email=${WP_USER_EMAIL}

wp plugin delete --allow-root akismet hello
wp plugin install --allow-root advanced-custom-fields --activate
wp plugin install --allow-root wp-statistics --activate

wp post delete --allow-root $(wp post list --allow-root --post_type='post' --format=ids)
wp post delete --allow-root $(wp post list --allow-root --post_type='post' --post_status=trash --format=ids)

wp post delete --allow-root $(wp post list --allow-root --post_type='page' --format=ids)
wp post delete --allow-root $(wp post list --allow-root --post_type='page' --post_status=trash --format=ids)

wp post create --allow-root --post_type=page --post_title='Home' --post_status=publish --post_author=$(wp user get --allow-root ${WP_USER} --field=ID --format=ids)

wp option update --allow-root show_on_front 'page'
wp option update --allow-root page_on_front $(wp post list --allow-root --post_type=page --post_status=publish --posts_per_page=1 --pagename=home --field=ID --format=ids)

wp rewrite structure --allow-root '/%postname%/' --hard
wp rewrite flush --allow-root --hard

mkdir /var/www/html/wp-content/themes/${WP_TITLE}_Theme