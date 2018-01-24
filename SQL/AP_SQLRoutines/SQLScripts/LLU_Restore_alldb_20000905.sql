use master
Restore database axdb_demo21 from disk='c:\MSSQL7\BACKUP\axdb_demo21.bak' WITH REPLACE, stats=10
Restore database axdb_km21 from disk='c:\MSSQL7\BACKUP\axdb_km21.bak' WITH REPLACE, stats=10
Restore database axdb_pivotal21 from disk='c:\MSSQL7\BACKUP\axdb_pivotal21.bak' WITH REPLACE, stats=10

Restore database demo_bm from disk='c:\MSSQL7\BACKUP\demo_bm.bak' WITH REPLACE, stats=10
Restore database demo_ed from disk='c:\MSSQL7\BACKUP\demo_ed.bak' WITH REPLACE, stats=10
Restore database cias_bm from disk='c:\MSSQL7\BACKUP\cias_bm.bak' WITH REPLACE, stats=10
Restore database cias_ed from disk='c:\MSSQL7\BACKUP\cias_ed.bak' WITH REPLACE, stats=10
Restore database Sales_bm from disk='c:\MSSQL7\BACKUP\sales_bm.bak' WITH REPLACE, stats=10
Restore database sales_ed from disk='c:\MSSQL7\BACKUP\sales_ed.bak' WITH REPLACE, stats=10

go