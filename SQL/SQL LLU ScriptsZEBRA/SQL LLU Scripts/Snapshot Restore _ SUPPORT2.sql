--select max(BATCHJOBHISTORY.CREATEDDATETIME) from BATCHJOBHISTORY


CREATE DATABASE SUPPORT2_AX2012_dbss20170710_1500 ON
( NAME = AX2012_PROD01, FILENAME = 'H:\LLU_Temp\SUPPORT2_AX2012_1_dbss20170710_1500.ss' ),
( NAME = AX2012_PROD02, FILENAME = 'H:\LLU_Temp\SUPPORT2_AX2012_2_dbss20170710_1500.ss' ),
( NAME = AX2012_PROD03, FILENAME = 'H:\LLU_Temp\SUPPORT2_AX2012_3_dbss20170710_1500.ss' ),
( NAME = AX2012_PROD04, FILENAME = 'H:\LLU_Temp\SUPPORT2_AX2012_4_dbss20170710_1500.ss' )
AS SNAPSHOT OF SUPPORT2_AX2012;
GO

USE master;  
RESTORE DATABASE SUPPORT2_AX2012 from   
DATABASE_SNAPSHOT = 'SUPPORT2_AX2012_dbss20170710_1500';