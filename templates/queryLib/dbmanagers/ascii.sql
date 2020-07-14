
select level dec, to_char(level,'XX') hex, chr(level) chr
from dual
where 
	( level between ascii('A') and ascii('Z'))
	or ( level between ascii('a') and ascii('z'))
	or ( level between ascii('0') and ascii('9'))
connect by level < ascii('z')+1
order by level
/
