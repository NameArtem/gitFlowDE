

SET PAUSE OFF
SET VERIFY OFF
set trimspool on
set line 500 arraysize 1
clear break
clear compute


set linesize 250 trimspool on
set pagesize 200

select *
--from table(dbms_xplan.display_cursor( null,null,'ALL ALLSTATS LAST'))
--
-- show estimated and elapsed timings
from table(dbms_xplan.display_cursor( null,null,'ALL ALLSTATS LAST'))
--from table(dbms_xplan.display_cursor( null,null,'ADVANCED LAST'))
--from table(dbms_xplan.display_cursor( null,null,'TYPICAL LAST'))
/


