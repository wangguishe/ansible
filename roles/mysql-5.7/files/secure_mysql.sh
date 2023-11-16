#!/bin/bash

init_passwd=`grep "temporary password is generated for root@localhost" /data/apps/mysql/logs/error.log | awk  '{print $NF}'`

SQL_SECURE () {
/usr/bin/expect<<EOF
set time 5
spawn /usr/local/mysql/bin/mysql_secure_installation -S /data/apps/mysql/mysql.sock
expect {
"Enter password for user root: " { send "${init_passwd}\r"; exp_continue }
"New password:" { send "2VxGRDs@@k^XWWtZ%kPB\r"; exp_continue }
"Re-enter new password" { send "2VxGRDs@@k^XWWtZ%kPB\r"; exp_continue }
"Press y|Y for Yes, any other key for No" { send "y\r"; exp_continue }
"Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG" { send "2\r"; exp_continue }
"Press y|Y for Yes, any other key for No)" { send "n\r"; exp_continue }
"Remove anonymous users" { send "y\r"; exp_continue }
"Disallow root login remotely" { send "y\r"; exp_continue }
"Remove test database and access to it" { send "y\r"; exp_continue }
"Reload privilege tables now" { send "y\r"; exp_continue }
}
EOF
}
SQL_SECURE
