
alter session set sql_trace=true;

-- Will write the text to the alert log. 
-- 1: write to trace file only
-- 2: write to alert log only
-- 3: write to both

begin
	sys.dbms_system.ksdwrt(1,'jkstill: test to trace file only');
	sys.dbms_system.ksdwrt(2,'jkstill: test to alert log only');
	sys.dbms_system.ksdwrt(3,'jkstill: test to alert log and trace file');
end;
/


-- from Julian Dyke, via Cary Millsap
-- write the time to a trace file
begin
	sys.dbms_system.ksdwrt(1,'timestamp marker');
	sys.dbms_system.ksdddt;
end;
/


alter session set sql_trace=true;


