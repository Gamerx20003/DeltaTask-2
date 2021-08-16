#! /bin/bash

mysql -uroot -prootpass -e"CREATE DATABASE MOMdb;" -e "use MOMdb;" -e "CREATE TABLE MoM(user varchar(10), date varchar(10), MoMer varchar(9),  MoM varchar(1000), PRIMARY KEY ( user ));"
mysql -uroot -prootpass -e "FLUSH PRIVILEGES;" -e "CREATE USER 'jay_jay'@'localhost' IDENTIFIED BY 'JJ';" -e "GRANT ALL PRIVILEGES ON *.* TO 'jay_jay'@'localhost';" -e "FLUSH PRIVILEGES;"
mysql -uroot -prootpass -e "CREATE USER 'readers'@'localhost' IDENTIFIED BY 'readers';" -e "GRANT SELECT, SHOW VIEW  ON MOMdb.* TO 'readers'@'localhost';" -e "FLUSH PRIVILEGES;"

mysql -uroot -prootpass -e "use MOMdb;" -e "CREATE TABLE users (user_name varchar(32), password varchar(32), domain varchar(10), PRIMARY KEY ( user_name ));" -e "INSERT INTO users (user_name, password, domain) VALUES ('AnuRag', 'superuserpass', 'admin');"
for i in {01..30}
do  
    mysql -uroot -prootpass -e "use MOMdb;" -e "INSERT INTO users (user_name, password, domain) VALUES ('sysad${i}', 'superuserpass', 'sysad');" -e "INSERT INTO users (user_name, password, domain) VALUES ('webdev${i}', 'superuserpass', 'webdev');"  -e "INSERT INTO users (user_name, password, domain) VALUES ('appdev${i}', 'superuserpass', 'appdev');"
done