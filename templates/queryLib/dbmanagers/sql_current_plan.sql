
@clears

set line 200

spool sql_current_plan.txt

select plan_table_output
from
	TABLE(
		dbms_xplan.display (
			'dynamic_plan_table',
			(
				select min(x) x
				from (
				select rawtohex(address)||'_'||child_number x
				from v$sql
				where hash_value = 3296599010
				)
			),
			'serial'
		)
	)
/

spool off

