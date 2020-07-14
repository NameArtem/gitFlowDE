


drop table sysevent_end;

create table sysevent_end
as
select
	event,
	total_waits,
	total_timeouts,
	time_waited/100 time_waited,
	average_wait
from v$system_event
-- order by doesn't work < 8i
--order by time_waited
/

update sysevent_snap set end_time =  sysdate;
commit;

@@sysevent_rpt


