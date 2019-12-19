select status,instance_name,database_role,protection_mode ,flashback_on from v$database,v$instance;


alter system set db_recovery_file_dest='';

ALTER SESSION SET CONTAINER=CDB$ROOT;


select name,log_mode from v$database;

archive log list;

alter system set log_archive_dest_1='LOCATION=/uv1249/arch/PROD' scope=spfile;

shutdown  immediate;

alter database archivelog;


startup mount;


