

select snap_id, snap_time, snap_level, executions_th
from 
(
	select *
	from perfstat.stats$snapshot
	order by snap_id desc
)
where rownum <= 10
order by snap_id
/

