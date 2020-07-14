

@clears
@ndf 1

set pagesize 60
set line 120

col sequence# format 99999999 head 'SWITCH|SEQUENCE'
col time format a20 head 'SWITCH TIME'
col time_to_switch format a12 head 'TIME SINCE|PREV SWITCH'
col bytes format 9,999,999,999 head 'BYTES'
col arch_write_time format 9999 head 'ARCH|WRITE|SECONDS'

with lograw as (
	select
		lc.sequence#
		,lc.thread#
		,lc.first_change#
		,lc.first_time
		,lc.first_time - lag(lc.first_time,1) over(order by sequence#) time_since_switch
	from v$log_history lc
),
loghist as (
select
	sequence#
	, first_change#
	, thread#
	, first_time
	-- get days portion of time since last log switch
	, to_char(trunc(time_since_switch))
		|| ':'
		-- get hours portion of time since last log switch
		|| to_char(trunc(sysdate)+time_since_switch,'hh24:mi:ss') time_to_switch
	from lograw
)
select
	a.sequence#
	, h.first_time
	, a.next_time
	, h.time_to_switch
	, a.completion_time
	, (a.completion_time - a.next_time) * 86400 arch_write_time
	, a.blocks * block_size bytes
	--, h.sequence#
	--, h.first_change#
	--, h.thread#
from loghist h
	, v$archived_log a
where a.thread# = h.thread#
	and a.sequence# = h.sequence#
	and a.FIRST_CHANGE# = h.FIRST_CHANGE#
	and a.dest_id = 1
	-- less than 1 minute
	--and substr(h.time_to_switch,1,8)  = '0:00:00:'
order by 1,2
/


