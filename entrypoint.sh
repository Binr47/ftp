#!/bin/sh

echo "sql:$SQL_PASS" | chpasswd

mysqld_safe &
sleep 5
echo "update mysql.user set plugin = 'mysql_native_password' where user='root';$
echo "update mysql.user set password=PASSWORD('$DB_PASS') where user='root';" |$
echo "flush privileges;" | mysql -u root

apache2ctl start

/usr/sbin/sshd -D


