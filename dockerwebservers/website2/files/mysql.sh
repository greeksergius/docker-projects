#!/bin/bash
namebase="wordpress"
pass="12345"
mysql -uroot <<MYSQL_SCRIPT
CREATE DATABASE $namebase CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER '$namebase'@'localhost' IDENTIFIED BY '$pass';
GRANT ALL PRIVILEGES ON $namebass.* TO '$namebase'@'localhost';
FLUSH PRIVILEGES;
MYSQL_SCRIPT

echo "MySQL database created."
echo "Database:   $namebase"
echo "Username:   $namebase"
echo "Password:   $pass"
