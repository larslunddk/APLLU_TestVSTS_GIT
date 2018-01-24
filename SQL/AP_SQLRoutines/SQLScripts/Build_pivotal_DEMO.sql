----------------------------------------------------------------
-- Building the pivotal database from scratch - 
-- written 14/06-2000
-- (c)1999 Lars Lund, Columbus IT Partner A/S
--
-- Computername/NT-server: llu-2000
-- DB Directory..........: c:\mssql7\data\
-- Pivotal SystemName....: DEMO_
-- NT-Admin Usergrp......: relationshipAdmin_DEMO
-- NT-User Usergrp.......: relationshipUsers_DEMO
----------------------------------------------------------------

USE master
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'DEMO_bm')
			              drop database DEMO_bm		
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'DEMO_ed')
				      drop database DEMO_ed   		
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'DEMO_bm_offline')
				      drop database DEMO_bm_offline   	
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'DEMO_ed_offline')
				      drop database DEMO_ed_offline	
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'DEMO_customize')
				      drop database DEMO_customize	
GO

CREATE DATABASE DEMO_bm
ON PRIMARY 	  ( NAME = DEMO_bm_1, 	 	FILENAME = 'c:\mssql7\data\DEMO_bm_1.mdf', 	SIZE = 50MB)
LOG ON 	          ( NAME = DEMO_bmlog_1, 	FILENAME = 'c:\mssql7\data\DEMO_bmlog_1.ldf', 	SIZE = 2MB)
GO
CREATE DATABASE DEMO_ed
ON PRIMARY 	  ( NAME = DEMO_ed_1, 		FILENAME = 'c:\mssql7\data\DEMO_ed_1.mdf', 	SIZE = 25MB)
LOG ON 	          ( NAME = DEMO_edlog_1, 	FILENAME = 'c:\mssql7\data\DEMO_edlog_1.ldf', 	SIZE = 2MB)
GO
CREATE DATABASE DEMO_bm_offline
ON PRIMARY 	  ( NAME = DEMO_bm_offline_1, 	FILENAME = 'c:\mssql7\data\DEMO_bm_offline_1.mdf', SIZE = 50MB)
LOG ON 	          ( NAME = DEMO_bmlog_offline_1,FILENAME = 'c:\mssql7\data\DEMO_bmlog_offline_1.ldf', SIZE = 2MB)
GO
CREATE DATABASE DEMO_ed_offline
ON PRIMARY 	  ( NAME = DEMO_ed_offline_1, 	FILENAME = 'c:\mssql7\data\DEMO_ed_offline_1.mdf', SIZE = 25MB)
LOG ON 	          ( NAME = DEMO_edlog_offline_1,FILENAME = 'c:\mssql7\data\DEMO_edlog_offline_1.ldf', SIZE = 2MB)
GO
CREATE DATABASE DEMO_customize
ON PRIMARY 	  ( NAME = DEMO_customize, 	FILENAME = 'c:\mssql7\data\DEMO_customize_1.mdf', SIZE = 10MB)
LOG ON 	          ( NAME = DEMO_customizelog_1, FILENAME = 'c:\mssql7\data\DEMO_customizelog_1.ldf', SIZE = 1MB)
GO

use master
IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'relationshipAdmin_DEMO')
BEGIN
	EXEC sp_grantlogin 'llu-2000\relationshipAdmin_DEMO'
END
GO
use DEMO_bm
IF NOT EXISTS (SELECT *
               FROM sysusers
               WHERE name = 'relationshipAdmin_DEMO' AND hasdbaccess = 1)
BEGIN
	use DEMO_bm
	EXEC sp_grantdbaccess 'llu-2000\relationshipAdmin_DEMO','relationshipAdmin_DEMO' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin_DEMO' 
	use DEMO_ed
	EXEC sp_grantdbaccess 'llu-2000\relationshipAdmin_DEMO','relationshipAdmin_DEMO' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin_DEMO' 
	use DEMO_bm_offline
	EXEC sp_grantdbaccess 'llu-2000\relationshipAdmin_DEMO','relationshipAdmin_DEMO' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin_DEMO' 
	use DEMO_ed_offline
	EXEC sp_grantdbaccess 'llu-2000\relationshipAdmin_DEMO','relationshipAdmin_DEMO' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin_DEMO' 
	use DEMO_customize
	EXEC sp_grantdbaccess 'llu-2000\relationshipAdmin_DEMO','relationshipAdmin_DEMO' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin_DEMO' 
	use master
	EXEC sp_grantdbaccess 'llu-2000\relationshipAdmin_DEMO','relationshipAdmin_DEMO' 
	GRANT EXEC on xp_logininfo to relationshipAdmin_DEMO
END

use master
IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'relationshipUsers_DEMO')
BEGIN
	EXEC sp_grantlogin 'llu-2000\relationshipUsers_DEMO' 
END
GO
use DEMO_bm
IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'relationshipUsers_DEMO' AND hasdbaccess = 1)
BEGIN
	use DEMO_bm
	EXEC sp_grantdbaccess 'llu-2000\relationshipUsers_DEMO','relationshipUsers_DEMO' 
	EXEC sp_addrolemember 'db_datareader','relationshipUsers_DEMO' 
	EXEC sp_addrolemember 'db_datawriter','relationshipUsers_DEMO' 
	use DEMO_ed
	EXEC sp_grantdbaccess 'llu-2000\relationshipUsers_DEMO','relationshipUsers_DEMO' 
	EXEC sp_addrolemember 'db_datareader','relationshipUsers_DEMO' 
	EXEC sp_addrolemember 'db_datawriter','relationshipUsers_DEMO' 
END
GO


