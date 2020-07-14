

@@gg_env

set line 200

break on owner on table_name on log_group_name skip 1

select 
	lg.owner
	, lg.table_name
	, lg.log_group_name
	, lgc.column_name
	, lgc.logging_property
from dba_log_groups lg
join dba_log_group_columns lgc on lgc.owner = lg.owner
	and lgc.log_group_name = lg.log_group_name
	and lgc.table_name = lg.table_name
where lg.owner = '&&v_rep_schema'
order by lg.owner, lg.table_name, lgc.position
/
