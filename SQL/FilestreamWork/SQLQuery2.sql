/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [Id]
      ,[DIRECTORY]
      ,[FILENAME]
      ,[EXTENSION]
      ,[doc]
  FROM [Archive].[dbo].[Records]
  where contains (doc, 'kuoni near mcd')