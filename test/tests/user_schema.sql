select tables_are('test_user',
                 ARRAY ['users'],
                 'Schema test_user contains users table');
select columns_are('test_user',
                   'users',
                  ARRAY [ 'user_id', 'user_name', 'ts'],
                  'test_user.users column check');
