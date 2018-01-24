----------------------------------------------------------------
-- Building the pivotal database from scratch - 
-- written 14/06-2000
-- (c)1999 Lars Lund, Columbus IT Partner A/S
--
-- Computername/NT-server: LLU-2000
-- DB Directory..........: c:\mssql7\data\
-- Pivotal SystemName....: CIAS_
-- NT-Admin Usergrp......: relationshipAdmin_Cias
-- NT-User Usergrp.......: relationshipUsers_Cias
----------------------------------------------------------------

USE master
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'CIAS_bm')
			              drop database CIAS_bm		
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'CIAS_ed')
				      drop database CIAS_ed   		
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'CIAS_bm_offline')
				      drop database CIAS_bm_offline   	
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'CIAS_ed_offline')
				      drop database CIAS_ed_offline	
GO
IF EXISTS (SELECT * FROM sysdatabases WHERE name = 'CIAS_customize')
				      drop database CIAS_customize	
GO

CREATE DATABASE CIAS_bm
ON PRIMARY 	  ( NAME = CIAS_bm_1, 	 	FILENAME = 'c:\mssql7\data\CIAS_bm_1.mdf', 	SIZE = 50MB)
LOG ON 	          ( NAME = CIAS_bmlog_1, 	FILENAME = 'c:\mssql7\data\CIAS_bmlog_1.ldf', 	SIZE = 2MB)
GO
CREATE DATABASE CIAS_ed
ON PRIMARY 	  ( NAME = CIAS_ed_1, 		FILENAME = 'c:\mssql7\data\CIAS_ed_1.mdf', 	SIZE = 25MB)
LOG ON 	          ( NAME = CIAS_edlog_1, 	FILENAME = 'c:\mssql7\data\CIAS_edlog_1.ldf', 	SIZE = 2MB)
GO
CREATE DATABASE CIAS_bm_offline
ON PRIMARY 	  ( NAME = CIAS_bm_offline_1, 	FILENAME = 'c:\mssql7\data\CIAS_bm_offline_1.mdf', SIZE = 50MB)
LOG ON 	          ( NAME = CIAS_bmlog_offline_1,FILENAME = 'c:\mssql7\data\CIAS_bmlog_offline_1.ldf', SIZE = 2MB)
GO
CREATE DATABASE CIAS_ed_offline
ON PRIMARY 	  ( NAME = CIAS_ed_offline_1, 	FILENAME = 'c:\mssql7\data\CIAS_ed_offline_1.mdf', SIZE = 25MB)
LOG ON 	          ( NAME = CIAS_edlog_offline_1,FILENAME = 'c:\mssql7\data\CIAS_edlog_offline_1.ldf', SIZE = 2MB)
GO
CREATE DATABASE CIAS_customize
ON PRIMARY 	  ( NAME = CIAS_customize, 	FILENAME = 'c:\mssql7\data\CIAS_customize_1.mdf', SIZE = 10MB)
LOG ON 	          ( NAME = CIAS_customizelog_1, FILENAME = 'c:\mssql7\data\CIAS_customizelog_1.ldf', SIZE = 1MB)
GO

use master
IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'relationshipAdmin_Cias')
BEGIN
	EXEC sp_grantlogin 'LLU-2000\relationshipAdmin_Cias'
END
GO
use CIAS_bm
IF NOT EXISTS (SELECT *
               FROM sysusers
               WHERE name = 'relationshipAdmin_Cias' AND hasdbaccess = 1)
BEGIN
	use CIAS_bm
	EXEC sp_grantdbaccess 'LLU-2000\relationshipAdmin_Cias','relationshipAdmin_Cias' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin_Cias' 
	use CIAS_ed
	EXEC sp_grantdbaccess 'LLU-2000\relationshipAdmin_Cias','relationshipAdmin_Cias' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin_Cias' 
	use CIAS_bm_offline
	EXEC sp_grantdbaccess 'LLU-2000\relationshipAdmin_Cias','relationshipAdmin_Cias' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin_Cias' 
	use CIAS_ed_offline
	EXEC sp_grantdbaccess 'LLU-2000\relationshipAdmin_Cias','relationshipAdmin_Cias' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin_Cias' 
	use CIAS_customize
	EXEC sp_grantdbaccess 'LLU-2000\relationshipAdmin_Cias','relationshipAdmin_Cias' 
	EXEC sp_addrolemember 'db_owner','relationshipAdmin_Cias' 
	use master
	EXEC sp_grantdbaccess 'LLU-2000\relationshipAdmin_Cias','relationshipAdmin_Cias' 
	GRANT EXEC on xp_logininfo to relationshipAdmin_Cias
END

use master
IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'relationshipUsers_Cias')
BEGIN
	EXEC sp_grantlogin 'LLU-2000\relationshipUsers_Cias' 
END
GO
use CIAS_bm
IF NOT EXISTS (SELECT * FROM sysusers WHERE name = 'relationshipUsers_Cias' AND hasdbaccess = 1)
BEGIN
	use CIAS_bm
	EXEC sp_grantdbaccess 'LLU-2000\relationshipUsers_Cias','relationshipUsers_Cias' 
	EXEC sp_addrolemember 'db_datareader','relationshipUsers_Cias' 
	EXEC sp_addrolemember 'db_datawriter','relationshipUsers_Cias' 
	use CIAS_ed
	EXEC sp_grantdbaccess 'LLU-2000\relationshipUsers_Cias','relationshipUsers_Cias' 
	EXEC sp_addrolemember 'db_datareader','relationshipUsers_Cias' 
	EXEC sp_addrolemember 'db_datawriter','relationshipUsers_Cias' 
END
GO


