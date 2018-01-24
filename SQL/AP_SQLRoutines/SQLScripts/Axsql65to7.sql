
/* 990607/Damgaard Development, Script to change database-compatibility-level to 70 on upgraded Axapta database 

   NOTE ! Select your Axapta database in above DB: pickbox prior to executing script 
 	
*/
declare @dbname varchar(30);select @dbname=DB_NAME();
exec sp_dbcmptlevel @dbname, 70;
go


/* 990607/Damgaard Development, Script to run AFTER upgrading Microsoft SQL Server 6.5 to SQL Server 7.0 
   to allow Axapta to reindex database */
UPDATE SQLSYSTEMVARIABLES SET VALUE = 
'SELECT name FROM sysindexes WHERE indid>0 AND indid<255 AND id=object_id(''%s'') AND INDEXPROPERTY(id, name, ''IsStatistics'') = 0'
WHERE PARM= 'GETINDEX'
go