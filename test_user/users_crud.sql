/**Adds user record
*@function test_user.add_user
*@param in varchar p_user_name user name
*@return int user_id
*/
create or replace function test_user.add_user(p_user_name  in varchar)
returns int
as $$
 insert into test_user.users(user_name)
 values(p_user_name)
 returning user_id;
$$ language sql;

/**Updates user record
*@function test_user.alter_user
*@param in int p_user_id user id
*@param in varchar p_user_name user name
*@return int p_user_id
*/
create or replace function test_user.alter_user(p_user_id in integer,
                                                p_user_name  in varchar)
returns int
as $$
 update test_user.users
 set user_name = p_user_name,
     ts = now()
 where user_id = p_user_id
 returning user_id;
$$ language sql;

/**Deletes user record
*@function test_user.delete_user
*@param in integer p_user_id
*@return int p_user_id
*/
create or replace function test_user.delete_user(p_user_id in integer)
returns int
as $$
 delete from test_user.users
 where user_id = p_user_id
 returning user_id;
$$ language sql;
