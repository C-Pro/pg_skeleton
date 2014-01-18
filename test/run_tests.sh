#!/bin/bash
set -e
if [ ! -f ../install.cfg ] ;
  then
    echo 'Error! File install.cfg does not exist. Please create it:
            $ cp install.cfg.example install.cfg
            $ vi install.cfg'
    exit 1;
fi;

# Load settings:
. ../install.cfg

echo "Enter your schema user password"
pg_prove -h $db_host -p $db_port -d $db_name -U $db_user tests/run_*.sql
