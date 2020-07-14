


with gen (id) as (
        select 1 id from dual
        union all
        select gen.id + 1 as id
        from gen
        where id < 500
)
select count(id) from gen
/


