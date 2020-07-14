
select * 
from perfstat.stats$sqltext
where last_snap_id = ( select max(snap_id) from perfstat.stats$snapshot)
/
