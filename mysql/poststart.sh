#!/bin/bash

# Wait until MySQL is really available
maxcounter=45
 
counter=1
while ! mysql --protocol TCP -u "$MYSQL_USER" --password="$MYSQL_PASSWORD" -e "show databases;" > /dev/null 2>&1; do
  sleep 1
  counter=`expr $counter + 1`
  if [ $counter -gt $maxcounter ]; then
     >&2 echo "We have been waiting for MySQL too long already; failing."
    exit 1
  fi;
done

mysql --protocol TCP -u root --password=$MYSQL_ROOT_PASSWORD << EOF

CREATE DATABASE demo;
GRANT USAGE ON *.* TO 'mysqluser'@'%';
GRANT ALL PRIVILEGES ON demo.* TO "mysqluser"@"%";
GRANT SELECT, RELOAD, SHOW DATABASES, REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO "mysqluser"@"%";
FLUSH PRIVILEGES;
USE demo;

CREATE TABLE member (
 id INT NOT NULL AUTO_INCREMENT,
 full_name VARCHAR(255) NOT NULL,
 birthdate DATE,
 account_hash BIGINT(15),
 modifiedTS DATETIME,
 PRIMARY KEY (id));

EOF

