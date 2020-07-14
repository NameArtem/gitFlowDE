


col which_hash new_value which_hash noprint
prompt Hash Value of SQL from STAT$SQLTEXT:
set echo off term off head off
select '&1' which_hash from dual;
set term on head on

var hashvar number
begin
	:hashvar := &&which_hash;
end;
/

set line 120

select plan_table_output
from TABLE(
	dbms_xplan.display('stats_plan_table',
		(
			select distinct spu.plan_hash_value || '_stats'
			from stats$sqltext st, stats$sql_plan_usage spu
			where st.hash_value = :hashvar
			and spu.hash_value = st.hash_value
			and spu.text_subset = st.text_subset
		),
		'serial' 
	)
)
/

undef 1


