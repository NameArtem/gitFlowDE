

@clears

col owner format a12
col object_type format a15
col object_name format a30

break on owner skip 1 on object_type

col spoolout new_value spoolfile 
set verify off

@title 'Invalid Objects' 70

select owner, object_type, object_name , status
from dba_objects
where status = 'INVALID'

order by owner, object_type, object_name
/


