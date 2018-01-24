USE master;
EXEC sp_dropserver 'TEST2','droplogins'
GO
EXEC sp_addlinkedserver 
	@server='TEST2', 
    @srvproduct='Oracle',
    @provider='OraOLEDB.Oracle', 
    @datasrc='DQORA8'
GO

EXEC sp_addlinkedsrvlogin @rmtsrvname = 'TEST2', 
   @useself = 'false', 
   @locallogin = 'llu7\llu', 
   @rmtuser = 'ax4test', 
   @rmtpassword = 'ax4test'    
    
select * 
FROM OPENQUERY(TEST2, 'SELECT COUNT(*)  
					  FROM dbo.LEDGERTRANS WHERE SUBSTR(NLS_LOWER(DATAAREAID),1,7) = ''tsc''')    

/*select count(*) from devsql.AX40SP2_KNI_UDV.dbo.ledgertrans
select count(*) from devsql.AX40SP2_KNI_UDV.dbo.ledgerbalancestrans
select count(*) from devsql.AX40SP2_KNI_UDV.dbo.ledgerbalancesdimtrans
select (817379/142845)
select (817379/39121)*/
GO

