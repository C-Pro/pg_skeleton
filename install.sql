\set ECHO all
\qecho 'Installing DB schema'

/* Creating tables first */
\i test_user/create_tables.sql

/* Stored functions */
\i test_user/functions.sql

\qecho 'Done.'
