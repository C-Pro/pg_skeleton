\i setup.sql
select plan(7+2+1);

--7 tests
\i tests/user_crud.sql
--2 tests
\i tests/user_schema.sql
--1 test
select * from test.test_scheme_check_func('test_user');

ROLLBACK;
