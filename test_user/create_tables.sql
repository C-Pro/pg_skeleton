create schema test_user;
comment on schema test_user is 'Схема для примеров pgTAP: пользователи';

create table test_user.users
(
 user_id serial primary key,
 user_name      varchar(128) unique not null,
 ts             timestamp default now()
);