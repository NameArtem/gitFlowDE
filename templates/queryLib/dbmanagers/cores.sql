
col value format 9999

select stat_name, value
from v$osstat
where osstat_id in (16,17)
/
