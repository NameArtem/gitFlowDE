
set line 200 trimspool on
set head off pagesize 0 feed on

with multbin as (
	select owner, original_name, type
	from dba_recyclebin
	group by owner, original_name, type
	having count(*) > 1
	order by 1,2
),
-- get all objects in recylebin that have 1+ copies
purgeobjects as (
	select rb.owner, rb.original_name, rb.object_name, rb.type, rb.droptime
	from dba_recyclebin rb
	join multbin mb on mb.owner = rb.owner and mb.original_name = rb.original_name
	-- do not include the most recent object
	where (rb.owner,rb.original_name,rb.droptime) not in (
		select rb.owner, rb.original_name, max(rb.droptime)
		from dba_recyclebin rb
		join multbin mb on mb.owner = rb.owner and mb.original_name = rb.original_name
		group by rb.owner, rb.original_name
	)
)
select 'purge ' || type || ' ' || owner || '."' || object_name || '";'
from purgeobjects
/

set head on pagesize 60


