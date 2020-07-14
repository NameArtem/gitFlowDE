
with sqlreads as (
	select distinct sql_id, snap_id,  instance_number, disk_reads - lag(disk_reads) over (partition by sql_id order by snap_id) disk_reads
	from perfstat.stats$sql_summary
	order by 4 desc nulls last
)
select *
from sqlreads
where rownum <= 10
/

