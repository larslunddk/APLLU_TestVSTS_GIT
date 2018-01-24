use widsql3_cit_udv
update userinfo set password = ''
	where id = 'frki'
GO
CREATE USER [bmssa] FOR LOGIN [bmssa]
GO
EXEC sp_addrolemember N'db_owner', N'bmssa'
GO