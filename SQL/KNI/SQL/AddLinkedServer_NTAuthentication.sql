/****** Object:  LinkedServer [SISAXSQLDB1\TEST]    Script Date: 03/04/2009 10:06:48 ******/
EXEC master.dbo.sp_addlinkedserver @server = N'SISAXSQLDB1\TEST', @srvproduct=N'SQL Server'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'collation compatible', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'data access', @optvalue=N'true'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'dist', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'pub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'rpc', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'rpc out', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'sub', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'connect timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'collation name', @optvalue=null
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'lazy schema validation', @optvalue=N'false'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'query timeout', @optvalue=N'0'
GO
EXEC master.dbo.sp_serveroption @server=N'SISAXSQLDB1\TEST', @optname=N'use remote collation', @optvalue=N'true'