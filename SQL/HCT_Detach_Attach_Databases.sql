use master
EXEC sp_detach_db 'axdb3_HCT', 'true'
GO
EXEC sp_attach_db @dbname = N'axdb3_HCT', 
   @filename1 = N'd:\sql_data\axdb3_HCT.mdf', 
   @filename2 = N'd:\sql_data\axdb3_HCT_log.ldf'
GO
EXEC sp_detach_db 'axdb25_HCT', 'true'
GO
EXEC sp_attach_db @dbname = N'axdb25_HCT', 
   @filename1 = N'd:\sql_data\axdb25_HCT.mdf', 
   @filename2 = N'd:\sql_data\axdb25_HCT_log.ldf'
GO
