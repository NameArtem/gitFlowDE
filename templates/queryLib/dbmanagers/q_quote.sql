


col v_sql new_value v_sql noprint

set term off feed off
select q'[&1]' v_sql from dual;
set term on feed on

prompt V_SQL: &&v_sql

