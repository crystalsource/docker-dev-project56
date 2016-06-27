#!/bin/bash

/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Connection established?"
    sleep 5
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

mysql -uroot -e "CREATE DATABASE project;"
mysql -uroot -D project < /var/www/sqldump/project.sql

echo "#############################"
echo "## MySQL-File imported     ##"
echo "#############################"

mysqladmin -uroot shutdown