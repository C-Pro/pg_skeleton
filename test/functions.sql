
create or replace function test.test_scheme_check_func(p_scheme varchar)
returns setof text as
$$
declare
   v_array text[];
begin   
        select array_agg(f_name)
        into v_array
        from (
                select distinct(n.nspname || '.' || p.proname)  as f_name
                from pg_proc p,
                     pg_namespace n
                where n.oid = p.pronamespace
                and   n.nspname = p_scheme
                except
                select distinct(array_to_string(regexp_matches (descr,'\w+.\w+'),',','*')) as f_name
        from __tresults__
        ) as r;
        return next is(v_array,null,'Проверка наличия тестов для функций cхемы '||p_scheme||'.');
end;
$$ language plpgsql;

\i ../test/functions_users.sql
