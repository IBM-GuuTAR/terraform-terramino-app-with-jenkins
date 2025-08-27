#!/bin/bash
# Set your desired port here
APACHE_PORT=5000

# Update packages
apt update -y
apt upgrade -y

# Remove existing Apache if present
apt remove -y apache2

# Install Apache, PHP, and MySQL server
apt install -y apache2 php libapache2-mod-php mysql-server php-mysql

# Update Apache to listen on the specified port
sed -i "s/Listen 80/Listen $APACHE_PORT/" /etc/apache2/ports.conf
sed -i "s/<VirtualHost \*:80>/<VirtualHost \*:$APACHE_PORT>/" /etc/apache2/sites-available/000-default.conf

# Start and enable Apache service
systemctl start apache2
systemctl enable apache2

# Add the ubuntu user to the www-data group
usermod -a -G www-data ubuntu

# Set permissions for /var/www
chown -R ubuntu:www-data /var/www
chmod 2775 /var/www
find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;

# Download the index.php file
cd /var/www/html
curl -O https://raw.githubusercontent.com/hashicorp/learn-terramino/main/index.php

# Restart Apache to apply changes
systemctl restart apache2
