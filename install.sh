#!/usr/bin/env bash

WPPLUGINS=( all-in-one-wp-migration )

echo "Starting WP installation..."

printf "Site name: "
read -e sitename

printf "Site URL: "
read -e siteurl

printf "DB Name: "
read -e dbname

printf "DB User: "
read -e dbuser

printf "DB Password: "
read -e dbpassword

wp core download
wp core config --db=$dbname --dbuser=$dbuser --dbpass=$dbpass
wp db create
wp core install --url=$siteurl --title="$sitename" --admin_user="admin" --admin_password="admin" --admin_email="pilarjan4111@gmail.com"

wp plugin delete --all
wp plugin install ${WPPLUGINS[@]} --activate

echo "WP installation complete."