#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

mysql -uroot -e "CREATE DATABASE project;"
mysql -uroot -D project < /var/www/sqldump/project.sql

echo "#############################"
echo "## MySQL-File imported     ##"
echo "#############################"

mysqladmin -uroot shutdown