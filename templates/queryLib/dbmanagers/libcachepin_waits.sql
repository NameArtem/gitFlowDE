

@clears
set line 115

ttitle "Library Cache Waiters"

COL owner format a8
COL object format a30

select o.owner, o.object, s.username, b.sid, b.serial#, b.mode_held, b.request
from (
	SELECT kglnaown AS owner, kglnaobj as Object
	FROM sys.x$kglob
	WHERE kglhdadr in (
		select e.p1raw
		from v$session s, v$session_wait e
		where s.sid = e.sid
		and e.event like 'library cache pin'
	)
) o,
(
	SELECT 
		s.sid
		, s.serial#
		, kglpnmod mode_held
		, kglpnreq request
	FROM sys.x$kglpn p, sys.v_$session s
	WHERE p.kglpnuse = s.saddr
	AND kglpnhdl in (
		select e.p1raw
		from v$session s, v$session_wait e
		where s.sid = e.sid
		and e.event like 'library cache pin'
		and kglpnmod = 0 -- mode held - 0 indicates waiter
	)
) b,
v$session s
where b.serial# = s.serial#
and b.sid = s.sid
/


ttitle "Library Cache Blockers"

COL owner format a8
COL object format a30

select o.owner, o.object, s.username, b.sid, b.serial#, b.mode_held, b.request
from (
	SELECT kglnaown AS owner, kglnaobj as Object
	FROM sys.x$kglob
	WHERE kglhdadr in (
		select e.p1raw
		from v$session s, v$session_wait e
		where s.sid = e.sid
		and e.event like 'library cache pin'
	)
) o,
(
	SELECT 
		s.sid
		, s.serial#
		, kglpnmod mode_held
		, kglpnreq request
	FROM sys.x$kglpn p, sys.v_$session s
	WHERE p.kglpnuse = s.saddr
	AND kglpnhdl in (
		select e.p1raw
		from v$session s, v$session_wait e
		where s.sid = e.sid
		and e.event like 'library cache pin'
		and kglpnmod != 0 -- mode held - 0 indicates possible blocker
	)
) b,
v$session s
where b.serial# = s.serial#
and b.sid = s.sid
/




