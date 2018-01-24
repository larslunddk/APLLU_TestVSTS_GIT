--Specify the name of the database to count in the following line
USE axdb_lp;
GO
SELECT o.name AS "Table Name", i.rowcnt AS "Row Count"
FROM sysobjects o, sysindexes i
WHERE i.id = o.id
AND indid IN(0,1)
AND xtype = 'u' 
AND o.name <> 'sysdiagrams' 
ORDER BY i.rowcnt DESC
COMPUTE SUM(i.rowcnt);
GO
