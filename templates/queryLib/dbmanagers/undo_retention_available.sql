
col retention_seconds format 999,999,999,999

with undo_tbs as (
		select upper(value) undo_tablespace
		from v$parameter
		where name = 'undo_tablespace'
),
undo_bytes as (
	select
		sum( decode(f.autoextensible,'YES',f.maxbytes,f.bytes )) undo_bytes
	from dba_data_files f
	join undo_tbs ut on f.tablespace_name = ut.undo_tablespace
),
undo_blks_per_second as (
	SELECT (SUM(undoblks)/SUM(((end_time - begin_time)*86400))) AS UPS
	FROM v$undostat
),
undo_blk_size as (
	select dt.block_size as DBS
	from dba_tablespaces dt
	join undo_tbs ut on dt.tablespace_name = ut.undo_tablespace
)
select ( ub.undo_bytes - (ubs.DBS * 24)) / (ups.ups * ubs.DBS) retention_seconds
FROM undo_blks_per_second ups,
	undo_blk_size ubs,
	undo_bytes ub
/
