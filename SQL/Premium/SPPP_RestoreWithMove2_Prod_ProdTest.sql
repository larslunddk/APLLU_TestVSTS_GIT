BACKUP DATABASE [AxProd] TO  DISK = N'E:\SQL\Backup\AxProd_20140820.bak'
WITH  COPY_ONLY, NOFORMAT, INIT,  NAME = N'AxProd-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10 GO BACKUP DATABASE [AxProd_model] TO  DISK = N'E:\SQL\Backup \axProd_model_20140820.bak' WITH  COPY_ONLY, NOFORMAT, INIT,  NAME = N'AxProd_model-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10 GO

USE [master]
RESTORE DATABASE [AxProdTest]
	FROM  DISK = N'E:\SQL\Backup\AxProd_20140820.bak'
	WITH  FILE = 1,
	MOVE N'AxProd' TO N'E:\SQL\Data\AxProdTest.mdf',
	MOVE N'AxProd_log' TO N'F:\SQL\Log\AxProdTest_log.ldf',
	NOUNLOAD,  STATS = 5

GO
USE [master]
RESTORE DATABASE [AxProdTest_model]
	FROM  DISK = N'E:\SQL\Backup\AxProd_model_20140820.bak'
	WITH  FILE = 1,
	MOVE N'AxProd_model' TO N'E:\SQL\Data\AxProdTest_model.mdf',
	MOVE N'AxProd_model_log' TO N'F:\SQL\Log\AxProdTest_model_log.ldf',
	NOUNLOAD,  STATS = 5
GO

ALTER DATABASE [AxProdTest_model]
              modify file(NAME='AxProd_model',NEWNAME='AxProdTest_model')
ALTER DATABASE [AxProdTest_model]
              modify file(NAME='AxProd_model_log',NEWNAME=
'AxProdTest_model_log')
ALTER DATABASE [AxProdTest]
              modify file(NAME='AxProd',NEWNAME='AxProdTest')
ALTER DATABASE [AxProdTest]
              modify file(NAME='AxProd_log',NEWNAME='AxProdTest_log')
