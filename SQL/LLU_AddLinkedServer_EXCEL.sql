EXEC master.dbo.sp_dropserver 'XLTEST_DMO', 'droplogins'
/****** Object:  LinkedServer [EXCELTST]    Script Date: 10/08/2008 08:08:24 ******/
EXEC master.dbo.sp_addlinkedserver 
		@server = N'XLTEST_DMO', 
		@srvproduct=N'Excel', 
		@provider=N'Microsoft.Jet.OLEDB.4.0', 
		@datasrc=N'c:\temp\poster.xls', 
		@provstr=N'Excel 8.0'
GO
SELECT * FROM XLTEST_DMO...poster$
	where Tekst like '%Q8%'