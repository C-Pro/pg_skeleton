create or replace function test.test_user_0010()
returns setof text as
$$
declare
 v_user_id integer;
begin
  return next lives_ok('select test_user.add_user(''testuser unique''::varchar);',
                       'test_user.add_user doesnt throw exception');

  v_user_id := test_user.add_user('blah blah');
  return next cmp_ok(v_user_id,
                     '>',
                     0,
                     'test_user.add_user: returns ok');

  return next results_eq('select user_name::varchar from test_user.users where user_id=' || v_user_id::varchar,
                         'select ''blah blah''::varchar',
                         'test_user.add_user inserts record');

  return next is(test_user.alter_user(v_user_id,'new user name blah'),
                 v_user_id,
                 'test_user.alter_user: returns ok');

  return next results_eq('select user_name::varchar from test_user.users where user_id=' || v_user_id::varchar,
                         'select ''new user name blah''::varchar',
                         'test_user.alter_user updates record');

  return next is(test_user.delete_user(v_user_id),
                 v_user_id,
                 'test_user.delete_user: returns ok');

  return next is_empty('select 1 from test_user.users where user_id=' || v_user_id::varchar,
                       'test_user.delete_user: deletes ok');
end;
$$ language plpgsql;
