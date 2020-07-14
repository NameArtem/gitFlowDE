
@clears

col username heading 'USERNAME' format a10
col sessions heading 'SESSIONS'
col sid heading 'SID' format 99999
col status heading 'STATUS' format a10
col server_program format a20 head 'SERVER PROGRAM'
col spid format a5 head 'SRVR|PID'
col serial# format 99999 head 'SERIAL#'
col logon_time format a17 head 'LOGON TIME'
col idle_time format a11 head 'IDLE TIME'
col ppid format 99999 head 'PID'

set recsep off term on pause off verify off echo off
set line 200
set trimspool on

clear break
break on username skip 1

select
	s.username,
	s.sid,
	s.serial#,
	p.pid ppid,
	s.status,
	p.program server_program,
	p.spid spid,
	to_char(logon_time, 'mm/dd/yy hh24:mi:ss') logon_time,
	-- idle time
	-- days added to hours
	--( trunc(LAST_CALL_ET/86400) * 24 ) || ':'  ||
	-- days separately
	substr('0'||trunc(LAST_CALL_ET/86400),-2,2)  || ':'  ||
	-- hours
	substr('0'||trunc(mod(LAST_CALL_ET,86400)/3600),-2,2) || ':' ||
	-- minutes
	substr('0'||trunc(mod(mod(LAST_CALL_ET,86400),3600)/60),-2,2) || ':' ||
	--seconds
	substr('0'||mod(mod(mod(LAST_CALL_ET,86400),3600),60),-2,2)  idle_time
from v$session s, v$process p
where s.username is not null
	-- use outer join to show sniped sessions in
	-- v$session that don't have an OS process
	and p.addr(+) = s.paddr
	and p.program like '%(J%'
order by username, sid
/

set recsep wrapped

