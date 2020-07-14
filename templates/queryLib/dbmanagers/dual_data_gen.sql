
select myrownum
from (select rownum myrownum from dual connect by level <= 100)
/

