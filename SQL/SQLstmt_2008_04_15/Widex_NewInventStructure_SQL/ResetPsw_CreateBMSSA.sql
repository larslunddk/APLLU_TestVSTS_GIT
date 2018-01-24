use master
restore database widsql3_cit_1 from disk='G:\MSSQL\Data\Backup_cit\WIDSQL_2.bak' with replace,stats=10

use widsql3_cit_1
update userinfo set password = ''
	where id = 'frki'
GO
CREATE USER [bmssa] FOR LOGIN [bmssa]
GO
EXEC sp_addrolemember N'db_owner', N'bmssa'
GO