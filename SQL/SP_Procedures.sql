exec sp_spaceused
exec sp_helpfile
exec sp_who
exec sp_lock
exec sp_monitor
exec sp_helpdb
exec sp_helpserver
exec sp_helpdevice

exec sp_resetstatus --of a suspect DB
exec sp_renamedb 'axdb3_TelDat','axdb3_Telia'
--  old_name   new_name


---Rename logical filename----------------------------
use axdb3_T2
GO
ALTER DATABASE axdb3_T2 
MODIFY FILE (NAME='axdb3_T1_Data',NEWNAME='axdb3_T2_Data')
GO
ALTER DATABASE axdb3_T2
MODIFY FILE (NAME='axdb3_T1_Log',NEWNAME='axdb3_T2_Log')
GO
