use master
EXEC sp_dropdevice 'LLU_Axapta', 'DELFILE'
EXEC sp_dropdevice 'LLU_PRCIAS', 'DELFILE'
EXEC sp_dropdevice 'LLU_PRDEMO', 'DELFILE'
EXEC sp_dropdevice 'LLU_SYSTEM', 'DELFILE'

EXEC sp_addumpdevice 'disk', 'LLU_Axapta', 'c:\mssql7\backup\LLU_Axapta.bak'
EXEC sp_addumpdevice 'disk', 'LLU_PRCIAS', 'c:\mssql7\backup\LLU_PRCIAS.bak'
EXEC sp_addumpdevice 'disk', 'LLU_PRDEMO', 'c:\mssql7\backup\LLU_PRDEMO.bak'
EXEC sp_addumpdevice 'disk', 'LLU_SYSTEM', 'c:\mssql7\backup\LLU_SYSTEM.bak'


BACKUP DATABASE axdb_demo21 	TO LLU_Axapta 	with stats=10
BACKUP DATABASE axdb_km21 	TO LLU_Axapta	with stats=10

BACKUP DATABASE CIAS_bm 	TO LLU_PRCIAS	with stats=10
BACKUP DATABASE CIAS_ed 	TO LLU_PRCIAS	with stats=10
BACKUP DATABASE CIAS_bm_offline TO LLU_PRCIAS	with stats=10
BACKUP DATABASE CIAS_ed_offline TO LLU_PRCIAS	with stats=10
BACKUP DATABASE CIAS_customize 	TO LLU_PRCIAS	with stats=10

BACKUP DATABASE DEMO_bm 	TO LLU_PRDEMO	with stats=10
BACKUP DATABASE DEMO_ed 	TO LLU_PRDEMO	with stats=10
BACKUP DATABASE DEMO_bm_offline TO LLU_PRDEMO	with stats=10
BACKUP DATABASE DEMO_ed_offline TO LLU_PRDEMO	with stats=10
BACKUP DATABASE DEMO_customize 	TO LLU_PRDEMO	with stats=10

BACKUP DATABASE Master  	TO LLU_SYSTEM	with stats=10
BACKUP DATABASE msdb 	  	TO LLU_SYSTEM	with stats=10
BACKUP DATABASE Model	  	TO LLU_SYSTEM	with stats=10
BACKUP DATABASE Tempdb  	TO LLU_SYSTEM	with stats=10
BACKUP DATABASE Pubs	  	TO LLU_SYSTEM	with stats=10

go
