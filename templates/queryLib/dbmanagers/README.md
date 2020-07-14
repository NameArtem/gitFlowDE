# Helpful Oracle SCRIPTS

> Based on Jonathan Lewis | Jared Still(@jkstill) | Michael Polaski | Tim Hall and other the best practices
> 'quite old but still works'

### BACKUP and RECOVERY:

* [Status of backups](rman-bkup-status.sql)

* [Details for a backup set](rman-bkup-details.sql)

* [Determine the SCN from which the database must be restored and recovered](rman-recovery-scn.sql)

* [Determine minimum restore and recover SCN values](rman-recovery-min-scn.sql)

-------------------

### PARALLEL PROCESSING:

* [Query gv$px_process to see all parallel slaves clusterwide-works for single node too](px.sql)
* [Aggregate PQ query counts per time period](pq-ash-all.sql)
* [Aggregate PQ per sqlid and time](pq-ash-sqlid.sql)
* [Aggregate PQ per time period](pq-awr-all.sql)
* [Aggregate PQ per sqlid and time](pq-awr-sqlid.sql)

---------------------

### SUPPORTING SCRIPTS:

* [generate a simple ascii table](ascii.sql)

* [clear sqlplus settings](clears.sql)

* [set sqlplus for spooling output without headers,etc](clear_for_spool.sql)

* [several sqlplus column settings](olumns.sql)

* [Demonstrate how to decode v$session.p1 values for enqueue waits](enqueue-bitand.sql)

* [get begin and end date, put in vars also date format var](get_date_range.sql)

* [get the XX.xx version of oracle and store in &v_oversion_minor](oversion_minor.sql)

* [get the XX version of oracle and store in &v_oversion_major](oversion_major.sql)

* [set title and width](title.sql)

* [set custom date and time formats, several options available at runtime](nls_date_format.sql)

* [set custom date and time formats](nls_time_format.sql)

* [demonstrates a very useful technique for conditionally executing SQL](sql_trick_1.sql)

--------------------------

### RDBMS UTILITIES:

* [Set event 10046 in a session](10046.sql)

* [Stop event 10046 in a session](10046_off.sql)

* [find which object a block belongs to](block_decode.sql)

* [report objects from sys.bootstrap$ that may not be modified](bootstrap_objects.sql)

* [get the clustering factor for all indexes on a table](cluster-cluster-factor.sql)

* [report the number of CPU cores from v$osstat may be subject to hyperthreading](cores.sql)

* [generate many rows from dual uses a lot of memory for large number of rows](dual_data_gen.sql)

* [generate many rows without using extra PGA](dual_data_gen-low-dual_data_gen-low-mem.sql)

* [use sys.dbms_log to write to log and trace files](dbms_log.sql)

* [some undocumented dbms_system calls how to write to alert.log](dbms_system_undoc_calls.sql)

* [Turn on SQL_trace in a session](dumptrace_off.sql)

* [Turn off SQL_trace in a session](dumptrace_on.sql)

* [Turn on SQL_trace for all sessions for a user](dumptracem_off.sql)

* [Turn off SQL_trace for all sessions for a user](dumptracem_on.sql)

* [Generate SQL script to duplicate a database role](dup_role.sql)

* [Generate SQL script to duplicate all users of a role](dup_role_users.sql)

* [Generate SQL script to duplicate a database user](dup_user.sql)

* [Dump a table to a CSV file, generate SQL Loader parameter and control files](dump.sql)

* [use a recursive subfactored query to generate rows](gen_data_with_recursion.sql)

* [generate existing foreign key constraints from data dictionary](gen_fk_from-11.gen_fk_from-11.1.sql)

* [generate existing foreign key constraints from data dictionary](gen_fk_from-11.gen_fk_from-11.2.sql)

* [generating test data with dual](gen_list_data_with_dual.sql)

* [get the hostname into substitution variable uhostname](gethostname.sql)

* [get the instance name into substitution variable uinstance](getinstance.sql)

* [get the instance owner intosubstitution variable uinstanceowner](getinstanceowner.sql)

* [get the session PID into substitution variable upid](getpid.sql)

* [copy the current sessions tracefile from the host](gettracefile.sql)

* [get the name of the current sessions tracefile into substitution variable utracefile](gettrcname.sql)

* [create a PL/SQL package 'hash' containing digest functions using dbms_crypto](hash-hash-function.sql)

* [Find the high water mark for each datafile and determine how much each file can be shrunk](hwm-hwm-df.sql)

* [dump the documentation for oradebug](oradebug_doc.sql)

* [Tom Kytes print_table, but as an anonymous block](print_table_2.sql)

* [similar to Tom Kytes print_table, but no stored procedure required and better quoting](pt.sql)

* [List events 1000-10999](show_event_messages.sql)

* [create a map of segments and free space](spacemap.sql)

* [set 10046 or 10053 trace per sqlid regardless of session](sqlid-sqlid-trace.sql)

* [list all sql available commands](sql-command-sql-command-types.sql)

* [Turn off SQL tracing for all sessions of an account](troff.sql)

* [Turn on SQL tracing for all sessions of an account](tron.sql)

* [generate DDL for owner.table, with indexes, constraints, etc](table_ddl.sql)

* [Generate SQL script to duplicate a database user using DBMS_METADATA](user_ddl.sql)

----------------------------------------

### IO:

* [Show avg physical read/write times](avg_disk_times.sql)

* [physical IO per session](who5.sql)

* [Save snapshot of current file IO statistics](io_begin.sql)

* [Save snapshot of current file IO statistics](io_end.sql)

* [Shows snapshot of IO stats based on io_begin and io_end](io_order.sql)

* [Shows snapshot of IO stats based on io_begin and io_end](io_stat.sql)

* [diagnose logfile sync](lfsdiag.sql)

* [Show IO per tablespace order by weight](ioweight.sql)

* [show real time redo rates at the db level](redo-redo-rate.sql)

* [Show current transactions with IO](showtrans.sql)

* [Transactions per hour with statistics per x action](trans_per_hour.sql)

-----------------

### EVENTS:

* [display session stats](my-my-events.sql)

* [various methods of generating trace and dump info with events](set_events.sql)

* [Beginning snapshot of system events](sysevent_begin.sql)

* [Ending snapshot of system events](sysevent_end.sql)

* [Report on system event snapshots](sysevent_rpt.sql)

* [Show events from v$session_event](sessevent2.sql)

* [Show events from v$session_event](sessevent.sql)

* [Show fix_control_settings for session](session_fix.sql)

* [Show fix_control_settings for system](system_fix.sql)

* [Show all fix_control_settings for system](system_fix_all.sql)

------------------------------

### WAITS/LOCKS/LATCHES and PERFORMANCE:

* [show which current active sessions are on CPU](active_status.sql)

* [max out a CPU. Do Not use in production!](cpu-cpu-killer.sql)

* [show itl waits increase initrans](itl_waits.sql)

* [show itl waits history](itl_waits_hist.sql)

* [Show latches and stats](showlatch.sql)

* [Show locks in database with waiters and blockers](showlock.sql)

* [Get stats from v$sysstat](getstats.sql)

* [Show waits from v$session_wait calls the script linked or copied to sesswaitu.sql](sesswait.sql)

* [script called by sesswait.sql copy or softlink one of the following sesswait scripts](sesswaitu.sql)

* [show current waits for a session id may call as '@sesswaitp SID'](sesswaitp.sql)

* [show waiters/blockers on library cache locks.](dba_kgllock.sql)

* [query v$mystat](mystat.sql)

---------------------------------

### STATSPACK:

* [start level 7 snapshot, sleep 2 minutes, complete snapshot and create report](snapNmin.sql)

* [get data associated with latest snapshot](sp_current.sql)

* [enter a begin and end date and this script looks up the snap_id for each and sets variables for them](sp_get_date_range.sql)

* [retrieve the SQL from input is the hash value of the sql statement in stats$sqltext this will be seen in reports created by spreport.sql in 9i+ where the snapshot level is 5+](sp_getsql.sql)

* [get statspack data on physical IO per drive and date range aggregated per hour](sp_io_stat_drive.sql)

* [report on total IO for the system aggregated per the hour](sp_io_stat_sys.sql)

* [run statspack snapshot every 15 minutes via dbms_job](sp_job_submit.sql)

* [change statspack to level 0](sp_lvl_0.sql)

* [change statspack to level 5](sp_lvl_5.sql)

* [change statspack to level 6](sp_lvl_6.sql)

* [change statspack to level 7](sp_lvl_7.sql)

* [get current default snapshot level](sp_lvl_current.sql)

* [example change statspack SQL collection levels](sp_lvl_sql.sql)

* [display historic execution plans from statspack data inputs are number of most recent snapshots to search and the SQL statement to look for (search is case insensitive) the function full_sql_text.sql must be created prior to running this script](sp_plan.sql)

* [use this to return the full text of a sql statement from statspack data version dependent may not be needed.](full_sql_text.sql)

* [Show execution plans from statspack data. first create view with sp_plan_table.sql input is the hash value of the sql statement in stats$sqltext this will be seen in reports created by spreport.sql in 9i+ where the snapshot level is 5+](sp_plan_hash.sql)

* [create a view stats_plan_table for use with dbms_xplan.display and stats$sql_plan](sp_plan_table.sql)

* [get the 10 most recent snapshots](sp_recent.sql)

* [history of processes and sessions from stats$resource_limit](sp_resource_limit.sql)

* [get top 10 SQL from statspack in terms of Disk Reads](sp_top_sql_io.sql)

--------------------------------

### USERS LOGGED ON:

* [get the server PID for your current session](get-curr-get-curr-ospid.sql)

* [summary of users logged on](who.sql)

* [detailed info of users logged on](who2.sql)

* [shortened version of who2.sql which is called by some scripts](who2s.sql)

* [detailed info of users logged on includes all instances and PDB for 12c](who2g.sql)

* [IO per session](who5.sql)

* [Show session info for background sessions](who6.sql)

* [Show session info with IO stats per session](who7.sql)

* [show sessions with jobs running (from dba_jobs)](who_dba_jobs.sql)

* [sessions using a database link](who_dblink.sql)

* [show connection method for each session](who_protocol.sql)

--------------------

### PARAMETERS:

* [](check_events.sql) Determine if any events are set in database

* [](get-alert-log-get-alert-log-location.sql) return the filename for the text based alert log file
* [](getallparm.sql) get parameters including hidden

* [](getparm.sql) get parameters

* [](parm-hist-parm-hist-diff.sql) show difference in parameters from AWR

* [](showallparm.sql) Show all database parameters, including .hidden. parameters

* [](showparm.sql) Show database parameters

* [](showparmchanges.sql) show parameters that have changed uses AWR

* [](showparmdrvr.sql) Performs the query for getparm.sql and showparm.sql

* [](showallparm73drvr.sql) Performs the query for getallparm.sql and showallparm.sql

* [](showallparm12c-showallparm12c-drvr.sql) 12c update for all parms

* [](parms_dump_csv.sql) Dump all parameters to CSV file

* [](parms_dump_12c_csv.sql) Dump all 12c parameters to CSV file

* [](sys_context.sql) Demo of getting oracle environment settings with sys_context function

------------------------

### EXECUTION_PLAN:

* [](explain_plan_columns.sql) column settings

* [](sql_current_plan.sql) get dynamic sql plans for hash value from v$sqlplan works on 9i must create view with dynamic_plan_table.sql

* [](dynamic_plan_table.sql) creates view used by sql_current_plan.sql

* [](liveplan.sql) get dynamic execution plan from hash value

* [](liveplan10g_hash.sql) get dynamic execution plan from hash value for 10g+

* [](liveplan10g_sqlid.sql) get dynamic execution plan from sql_id for 10g+

* [](liveplan_hash.sql) a bit of a misnomer pulls sql and hash value for a session

* [](showplan9i.sql) show execution plans for oracle 9i+

* [](showplan_last.sql) show execution plan for most recently executed cursor in current session

* [](gen_bind_vars.sql) gather bind values from v$sql_bind and generate SQL

* [](gen_bind_vars_awr.sql) gather bind values from dba_hist_sqltext and generate SQL

* [](get_bind_values.sql) get the bind values for a sql_id

* [](get_awr_bind_values.sql) get the bind values for a sql_id from AWR

### PL/SQL:

* [](build-build-record.sql) generate a PL/SQL record type based on table columns

* [](bulk-collect-bulk-collect-1.sql) demo of fetch .. bulk collect into

* [](dbms_output-dbms_output-abstracted.sql) abstracted procedures and functions for dbms_output

* [](get_table_lock.sql) runs a tight loop trying to acquire lock on table use on busy systems to get the lock required DO NOT LEAVE TABLE LOCKED!

* [](package-package-error.sql) show the source lines for a PL/SQL error

* [](raise_error.sql) raise any error in the database

* [](sqlplus_return_code.sql) examples of exiting SQLPlus with an error code

* [](sqlplus_return_code_2.sql) more examples of exiting SQLPlus with an error cod

* [](user_exit.sql) an example of exiting sqlplus if the current user is not the one expected

------------------------------------

### DATABASE STATISTICS DBMS_STATS OPTIMIZER:

* [](chk4incremental.sql) check to see if incremental stats were gathered for a table

* [](cursor-cursor-check.sql) some detail on open cursors per session

* [](cursor-cursor-counts.sql) simple report on cursors with count of child cursors

* [](cursor-invalidation-cursor-invalidation-reasons.sql) show reasons for cursor invalidation from v$sql_shared_cursor

* [](dbms_stats_get_prefs.sql) get stats prefs per table and indexes

* [](dbms_stats_report.sql) HTML report of dbms_stats activity

* [](dup-system-dup-system-stats.sql) Generate PL/SQL to duplicate system statistics to another database

* [](gather_table_stats.sql) gather stats on a tables specified in table_list.sql

* [](gather_system_stats_iteratively.sql) gather OS stats every 10 minutes for 24 hours

* [](get_system_stats.sql) display Oracle OS statistics

* [](global-global-prefs.sql) display global dbms_stats prefs

* [](get_prefs.sql) show stats prefs for a schema

* [](get_stats_job.sql) get name of stored procedure used for autotask stats job 10g+, maybe 9i

* [](get_stats_task.sql) get the name of the autotask task used to run the auto stats job 11g+

* [](getobj_stats.sql) show stats for a table down to subpartition level

* [](histogram_values.sql) show the actual values for histograms

* [](histo_types.sql) get type of histograms for a schema

* [](histo_dist.sql) show distribution for frequency histograms for schema,table, column

* [](histo_hist.sql) show historical histogram info for schema,table, column

* [](histo_hist_dist.sql) show distribution of values for historical histograms for schema,table, column

* [](locked_stats.sql) show tables and indexes with locked statistics

* [](logsetup.sql) called by some scripts to create a log create logs dir first

* [](ndv.sql) show NDV for a table

* [](os-stats-os-stats-avgs.sql) averages of OS IO stats trying to reduce SAN cache effect

* [](partstats.sql) Show basic stats info on table and partitions

* [](partstats_sum.sql) Summary of partition stats

* [](sampled_size.sql) show sample size used to collect stats

* [](sampled_size_details.sql) show sample size used to collect stats

* [](session-cursor-session-cursor-metrics.sql) show histograms for open and cached cursors

* [](set_avg_stats.sql) set average stats on empty partitions uses table_list.sql

* [](set_table_prefs.sql) set table preferences uses table_list.sql

* [](show_os_stats.sql) Show stats from v$aux_stats$

* [](show_os_stats_hist.sql) Show stats from wriS_optstat_aux_history

* [](stale-stale-stats.sql) Show stats that are stale and at least 7 days old

* [](stat.sql) get stats info for a table see comments

* [](stats_config.sql) set the schema name for some stats scripts

* [](stats_mod.sql) show stats being gathered by gather_table_stats.sql

* [](stats_prefs.sql) show dbms_stats preferences

* [](stats-stats-sqlid.sql) show basic stats infor for tables and indexes associated with a SQL_ID

* [](stats_trace.sql) show how to trace dbms_stats comments only

* [](stats_trace_test.sql) show that settings to trace stats are not persistent

* [](stats_wait.sql) show waits on stats collection

* [](sysaux_free.sql) show free space in sysaux

* [](table_list.sql) list of tables for gather_table_stats.sql

* [](unlock_stats.sql) unlocks stats uses table_list.sql

----------------------------

### AUTOTASK and SCHEDULER:

* [](autotask_auto_stats_disable.sql) disable automatic stats gathering

* [](autotask_auto_stats_enable.sql) enable automatic stats gathering

* [](autotask_auto_tasks_disable.sql) disable all autotasks

* [](autotask_auto_tasks_enable.sql) enable all autotasks

* [](autotask_client_attributes.sql) call dbms_auto_task_admin.get_client_attributes

* [](autotask_client_history.sql) show dba_autotask_client_history

* [](autotask_client_job.sql) show dba_autotask_client_job

* [](autotask_clients.sql) show dba_autotask_client

* [](autotask_job_history.sql) show dba_autotask_job_history

* [](autotask_operation.sql) show dba_autotask_operation

* [](autotask_sched.sql) show dba_autotask_schedule

* [](autotask_resources.sql) call dbms_auto_task_admin.get_p1_resources

* [](autotask_sql_setup.sql) set env for autotask scripts

* [](autotask_task.sql) show dba_autotask_task

* [](autotask_window_clients.sql) show dba_autotask_window_clients

* [](autotask_window_hist.sql) show dba_autotask_window_history

* [](dba_sched_jobs.sql) show dba_scheduler_jobs

* [](dba_sched_jobs_hist.sql) show scheduler jobs history

* [](opthist.sql) show values of dba_stats prefs from the source table

* [](schedcols.sql) col commands for scripts

* [](scheduler_programs.sql) show dba_scheduler_programs

* [](scheduler_windows.sql) show dba_scheduler_windows

* [](test_calendar_string.sql) provide a scheduler calendar string and number of iterations to see when job runs in dbms_scheduler.

---------------------------------------

### RESOURCE MANAGER:

* [](resmgr-resmgr-columns.sql) configure report columns

* [](resmgr-group-resmgr-group-privs.sql) show group privs

* [](resmgr-consumer-resmgr-consumer-groups.sql) show consumer groups

* [](resmgr-plan-resmgr-plan-directives.sql) show resource manager plan directives

* [](resmgr-resource-resmgr-resource-plans.sql) show resource manager plans

* [](resmgr-resmgr-setup.sql) set pagesize and linesizes

* [](resmgr-user-consumer-resmgr-user-consumer-groups.sql) show consumer group per user

* [](resmgr-resmgr-waits.sql) show resmgr waits

* [](resmgr-waits-resmgr-waits-pdb.sql) show resmgr waits per pdb

* [](resmgr-resmgr-who.sql) show resmgr waits per user


### METRICS: Metrics reported by oracle v$sysmetric, v$sysmetric_history ...

* [](metric-metric-names.sql) detail of metrics reported along with collection intervals

* [](os-os-load.sql) OS Load as reported by oracle for past hour
