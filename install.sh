#!/bin/bash
set -e

if [ ! -f install.cfg ] ; then
 echo 'Error! File install.cfg does not exist. Please create it:
	$ cp install.cfg.example install.cfg
	$ vi install.cfg'

 exit 1
fi;

# Load settings:
. install.cfg
read -p "Please input database schema owner ($db_user) password:" db_pass

echo "Creating database."
psql -v db_user=$db_user -v db_pass="'$db_pass'" -v db_name=$db_name -h $db_host -p $db_port -U postgres -f create_db.sql &>install.log

echo "Enabling extensions in database. Enter your postgres user password."
psql -h $db_host -p $db_port -d $db_name -U postgres -f extensions.sql &>>install.log

echo "Creating schema. Enter your schema user password."
psql -h $db_host -p $db_port -d $db_name -U $db_user -f install.sql &>> install.log

cd 'test'
./run_tests.sh

echo "Done!"