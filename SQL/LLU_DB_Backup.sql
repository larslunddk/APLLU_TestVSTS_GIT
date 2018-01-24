use master
EXEC sp_addumpdevice 'disk', 'axdb3_HCT', 'G:\hct\axdb30_HCT_Udendata.bak'
GO
BACKUP DATABASE axdb3_hct TO axdb3_HCT
go
use master
EXEC sp_addumpdevice 'disk', 'axdb25_HCT', 'G:\hct\axdb25_HCT_Udendata.bak'
GO
BACKUP DATABASE axdb25_hct TO axdb25_HCT
go