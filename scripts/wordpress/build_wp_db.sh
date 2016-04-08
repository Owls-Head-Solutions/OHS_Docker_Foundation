#!/bin/bash

#setup variable values
DB_NAME="WP_Foundation"
DB_USER_NAME="WP_User"
DB_PASS="OHSWPFoundationPW"

WP_TITLE="WPFoundation"
WP_USER="admin"
WP_USER_PASS="admin"
WP_USER_EMAIL="admin@admin.com"
WP_IP="192.168.56.100"

#create mysql db scrilpt
Q1="CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
Q2="GRANT USAGE ON *.* TO ${DB_USER_NAME}@localhost IDENTIFIED BY '${DB_PASS}';"
Q3="GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER_NAME}@localhost;"
Q4="FLUSH PRIVILEGES;"
SQL="${Q1}${Q2}${Q3}${Q4}"

#create mysql table
mysql -uroot -ppassword -e "$SQL"