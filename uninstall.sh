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

echo "Dropping database."
psql -v db_user=$db_user -v db_pass="'$db_pass'" -v db_name=$db_name -h $db_host -p $db_port -U postgres -f drop_db.sql
