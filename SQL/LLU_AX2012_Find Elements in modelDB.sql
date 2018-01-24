/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP 1000 [ElementType]
      ,[RootHandle]
      ,[ParentHandle]
      ,[ElementHandle]
      ,[Name]
      ,[AxId]
      ,[ParentId]
      ,[Origin]
      ,[PartOfInheritance]
  FROM [SUPPORT_AX2012_model].[dbo].[ModelElement]
  where elementtype = 44 and AxId = 866
  --where name = 'SpecTrans'