#!/bin/sh

#COLORS
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Cyan='\033[0;36m'         # Cyan

# Update packages and Upgrade system
echo -e "$Cyan \n Updating System.. $Color_Off"
sudo apt-get update -y && sudo apt-get upgrade -y

## Install Apache2
echo -e "$Cyan \n Installing Apache2 $Color_Off"
sudo apt-get install apache2 -y
sudo apache2ctl configtest
sudo ufw app list
sudo ufw app info "Apache Full"
sudo ufw allow in "Apache Full"

echo -e "$Cyan \n Installing PHP & Requirements $Color_Off"
sudo apt-get install php libapache2-mod-php php-mcrypt php-mysql -y

echo -e "$Cyan \n Installing MySQL $Color_Off"
sudo apt-get install mysql-server -y

echo -e "$Cyan \n Installing phpMyAdmin $Color_Off"
sudo apt-get install phpmyadmin -y

## TWEAKS and Settings
# Permissions
echo -e "$Cyan \n Permissions for /var/www $Color_Off"
sudo chown -R www-data:www-data /var/www
echo -e "$Green \n Permissions have been set www-data:www-data $Color_Off"

# Enabling Mod Rewrite, required for WordPress permalinks and .htaccess files
echo -e "$Cyan \n Enabling Modules $Color_Off"
sudo a2enmod rewrite
sudo phpenmod mcrypt

# Restart Apache
echo -e "$Cyan \n Restarting Apache $Color_Off"
sudo service apache2 restart

echo -e "$Cyan \n Installation Completed $Color_Off"