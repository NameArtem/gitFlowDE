
SET VERIFY OFF
SET LINESIZE 300

COLUMN value FORMAT 9999999
COLUMN sql_feature FORMAT A35
COLUMN optimizer_feature_enable FORMAT A9

SELECT *
FROM   v$system_fix_control
WHERE  LOWER(description) LIKE DECODE('&1', 'all', '%', '%&&1%')
AND    optimizer_feature_enable = DECODE('&2', 'all', optimizer_feature_enable, '&&2');

undef 1 2

