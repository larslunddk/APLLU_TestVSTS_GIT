use master
EXEC sp_dropdevice 'LLUDIFF_Axapta', 'DELFILE'
EXEC sp_dropdevice 'LLUDIFF_PRCIAS', 'DELFILE'
EXEC sp_dropdevice 'LLUDIFF_PRDEMO', 'DELFILE'

EXEC sp_addumpdevice 'disk', 'LLUDIFF_Axapta', 'c:\mssql7\backup\LLUdiff_Axapta.bak'
EXEC sp_addumpdevice 'disk', 'LLUDIFF_PRCIAS', 'c:\mssql7\backup\LLUdiff_PRCIAS.bak'
EXEC sp_addumpdevice 'disk', 'LLUDIFF_PRDEMO', 'c:\mssql7\backup\LLUdiff_PRDEMO.bak'
EXEC sp_addumpdevice 'disk', 'LLUDIFF_SYSTEM', 'c:\mssql7\backup\LLUdiff_SYSTEM.bak'


BACKUP DATABASE axdb_demo21 	  TO LLUdiff_Axapta 	with differential, stats=10
BACKUP DATABASE axdb_km21 	  TO LLUdiff_Axapta	with differential, stats=10

BACKUP DATABASE CIAS_bm 	  TO LLUdiff_PRCIAS	with differential, stats=10
BACKUP DATABASE CIAS_ed 	  TO LLUdiff_PRCIAS	with differential, stats=10
BACKUP DATABASE CIAS_bm_offline TO LLUdiff_PRCIAS	with differential, stats=10
BACKUP DATABASE CIAS_ed_offline TO LLUdiff_PRCIAS	with differential, stats=10
BACKUP DATABASE CIAS_customize  TO LLUdiff_PRCIAS	with differential, stats=10

BACKUP DATABASE DEMO_bm 	  TO LLUdiff_PRDEMO	with differential, stats=10
BACKUP DATABASE DEMO_ed 	  TO LLUdiff_PRDEMO	with differential, stats=10
BACKUP DATABASE DEMO_bm_offline TO LLUdiff_PRDEMO	with differential, stats=10
BACKUP DATABASE DEMO_ed_offline TO LLUdiff_PRDEMO	with differential, stats=10
BACKUP DATABASE DEMO_customize  TO LLUdiff_PRDEMO 	with differential, stats=10

BACKUP DATABASE Master  	  TO LLUDIFF_SYSTEM	with differential, stats=10
BACKUP DATABASE msdb 	  	  TO LLUDIFF_SYSTEM	with differential, stats=10
BACKUP DATABASE Model	  	  TO LLUDIFF_SYSTEM	with differential, stats=10
BACKUP DATABASE Tempdb  	  TO LLUDIFF_SYSTEM	with differential, stats=10
BACKUP DATABASE Pubs	  	  TO LLUDIFF_SYSTEM	with differential, stats=10


go
