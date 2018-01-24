USE master
EXEC sp_dropdevice 'axdbBackup'
EXEC sp_addumpdevice 'disk', 'axdbBackup', 'h:\mssql7\backup\tttsxdb.bak'
GO

use msdb
EXEC sp_delete_job @job_name = 'Ad hoc Data Backup'
GO

EXEC sp_add_job @job_name = 'Ad hoc Data Backup', 
    @enabled = 1,
    @description = 'Ad hoc backup of Axapta Database',
    @owner_login_name = 'sa'
    @notify_level_eventlog = 2,
    @notify_level_email = 2,
    --@notify_level_netsend =2,
    --@notify_level_page = 2,
    @notify_email_operator_name = 'llu@cias.dk',
    --@notify_netsend_operator_name = 'janet1', 
    --@notify_page_operator_name = 'janet1',
    --@delete_level = 1
GO
EXEC sp_add_jobstep @job_name = 'Ad hoc Data Backup',
    @step_name = 'Backup Axapta Database',
    @subsystem = 'TSQL',
    @command = 'BACKUP DATABASE axdb TO axdbBackup', 
    @retry_attempts = 5,
    @retry_interval = 5
GO

EXEC sp_add_jobschedule @job_name = 'Ad hoc Data Backup', 
    @name = 'Daily Scheduled Backup',
    @freq_type = 4, -- daily
    @freq_interval = 1,
    @active_start_time = 213300
GO

  
