#!/usr/bin/env bash

DBFILE=/vulamp/db/db.gz

if [ ! -f $DBFILE ]
    then
        echo "db.gz file not found!"
        exit
fi

DBNAME=project_database_name
DBPASS="root"

echo "Drop current db, create new ..."
sudo mysql -uroot -p$DBPASS -e "DROP DATABASE IF EXISTS $DBNAME;CREATE DATABASE $DBNAME;"

echo "Importing db, you will hear a sound at the end ..."
sudo mysql -uroot -p$DBPASS -e "SET GLOBAL foreign_key_checks = 0; SET GLOBAL unique_checks = 0; SET GLOBAL autocommit = 0;"
(echo "SET sql_log_bin=0;";sudo gunzip -c $DBFILE) | sudo mysql -uroot -p$DBPASS $DBNAME
sudo mysql -uroot -p$DBPASS -e "SET GLOBAL foreign_key_checks = 1; SET GLOBAL unique_checks = 1; SET GLOBAL autocommit = 1;"

echo "Done."
#sound at the end
echo -en "\007"
