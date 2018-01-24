----------------------------------------------------------------
-- Building the pivotal database from scratch - 
-- written 24/06-2000
-- (c)1999 Lars Lund, Columbus IT Partner A/S
--
-- Computername/NT-server: LLUHOME
-- DB Directory..........: c:\mssql7\data\
-- Pivotal SystemName....: demo_
-- NT-Admin Usergrp......: relationshipAdmin
-- NT-User Usergrp.......: relationshipUsers
----------------------------------------------------------------

USE master

IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'demo_bm')
			              drop database demo_bm
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'demo_ed')
				      drop database demo_ed
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'demo_bm_offline')
				      drop database demo_bm_offline
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'demo_ed_offline')
				      drop database demo_ed_offline	
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'demo_customize')
				      drop database demo_customize	
GO

CREATE DATABASE demo_bm
ON PRIMARY 	  ( NAME = demo_bm_1, 	 	FILENAME = 'c:\mssql7\data\demo_bm_1.mdf', 	SIZE = 50MB)
LOG ON 	          ( NAME = demo_bmlog_1, 	FILENAME = 'c:\mssql7\data\demo_bmlog_1.ldf', 	SIZE = 2MB)
GO
CREATE DATABASE demo_ed
ON PRIMARY 	  ( NAME = demo_ed_1, 		FILENAME = 'c:\mssql7\data\demo_ed_1.mdf', 	SIZE = 25MB)
LOG ON 	          ( NAME = demo_edlog_1, 	FILENAME = 'c:\mssql7\data\demo_edlog_1.ldf', 	SIZE = 2MB)
GO
CREATE DATABASE demo_bm_offline
ON PRIMARY 	  ( NAME = demo_bm_offline_1, 	FILENAME = 'c:\mssql7\data\demo_bm_offline_1.mdf', SIZE = 50MB)
LOG ON 	          ( NAME = demo_bmlog_offline_1,FILENAME = 'c:\mssql7\data\demo_bmlog_offline_1.ldf', SIZE = 2MB)
GO
CREATE DATABASE demo_ed_offline
ON PRIMARY 	  ( NAME = demo_ed_offline_1, 	FILENAME = 'c:\mssql7\data\demo_ed_offline_1.mdf', SIZE = 25MB)
LOG ON 	          ( NAME = demo_edlog_offline_1,FILENAME = 'c:\mssql7\data\demo_edlog_offline_1.ldf', SIZE = 2MB)
GO
CREATE DATABASE demo_customize
ON PRIMARY 	  ( NAME = demo_customize_, 	FILENAME = 'c:\mssql7\data\demo_customize_1.mdf', SIZE = 10MB)
LOG ON 	          ( NAME = demo_customizelog_1, FILENAME = 'c:\mssql7\data\demo_customizelog_1.ldf', SIZE = 1MB)
GO

use master
IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'relationshipAdmin')
BEGIN
	EXEC sp_grantlogin 'LLUHOME\relationshipAdmin'
END
GO
use demo_bm
IF NOT EXISTS (SELECT *
               FROM sysusers
               WHERE name = 'relationshipAdmin' AND hasdbaccess = 1)
BEGIN
	use demo_bm
	EXEC sp_grantdbaccess 'LLUHOME\relationshipAdmin','relationshipAdmin' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin' 
	use demo_ed
	EXEC sp_grantdbaccess 'LLUHOME\relationshipAdmin','relationshipAdmin' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin' 
	use demo_bm_offline
	EXEC sp_grantdbaccess 'LLUHOME\relationshipAdmin','relationshipAdmin' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin' 
	use demo_ed_offline
	EXEC sp_grantdbaccess 'LLUHOME\relationshipAdmin','relationshipAdmin' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin' 
	use demo_customize
	EXEC sp_grantdbaccess 'LLUHOME\relationshipAdmin','relationshipAdmin' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin' 
	use master
	EXEC sp_grantdbaccess 'LLUHOME\relationshipAdmin','relationshipAdmin' 
	GRANT EXEC on xp_logininfo to relationshipAdmin
END

use master
IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'relationshipUsers')
BEGIN
	EXEC sp_grantlogin 'LLUHOME\relationshipUsers' 
END
GO
use demo_bm
IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'relationshipUsers' AND hasdbaccess = 1)
BEGIN
	use demo_bm
	EXEC sp_grantdbaccess 'LLUHOME\relationshipUsers','relationshipUsers' 
	EXEC sp_addrolemember 'db_datareader','relationshipUsers' 
	EXEC sp_addrolemember 'db_datawriter','relationshipUsers' 
	use demo_ed
	EXEC sp_grantdbaccess 'LLUHOME\relationshipUsers','relationshipUsers' 
	EXEC sp_addrolemember 'db_datareader','relationshipUsers' 
	EXEC sp_addrolemember 'db_datawriter','relationshipUsers' 
END
GO

