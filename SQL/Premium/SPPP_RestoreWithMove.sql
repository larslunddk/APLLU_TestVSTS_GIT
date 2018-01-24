USE [master]
--BACKUP LOG [AxProd] TO  DISK = N'E:\SQL\Backup\AxProd_LogBackup_2014-07-28_15-16-38.bak' WITH NOFORMAT, NOINIT,  NAME = N'AxProd_LogBackup_2014-07-28_15-16-38', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [AxProd_20140726_1820] FROM  DISK = N'E:\SQL\Backup\Data Migration\AXProd_07262014_Initial.bak' 
WITH  FILE = 1,  
MOVE N'AxProd'		TO N'E:\SQL\Data\AxProd_20140726_1820.mdf',  
MOVE N'AxProd_log'	TO N'F:\SQL\Log\AxProd_20140726_1820_log.ldf',  
NOUNLOAD,  STATS = 5

GO
use axprod_20140726_1820
select * from IBM_INVENTLOADINGGROUP 
select * from AP_LVSPARAMETERS


select * from batch order by STARTDATETIME DESC
select * from BATCHJOB order by STARTDATETIME DESC