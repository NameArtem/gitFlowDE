
SET VERIFY OFF
SET LINESIZE 300

COLUMN sql_feature FORMAT A35
COLUMN optimizer_feature_enable FORMAT A9

SELECT *
FROM   v$session_fix_control
WHERE  session_id = DECODE('&1', 'all', session_id, '&&1')
AND    LOWER(description) LIKE DECODE('&2', 'all', '%', '%&&2%')
AND    optimizer_feature_enable = DECODE('&3', 'all', optimizer_feature_enable, '&&3');
