if exists (select * from sysobjects where id = object_id(N'[bmssa].[ACCESSRIGHTSLIST]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
exec sp_changeObjectOwner bmssa.ACCESSRIGHTSLIST, 'dbo'
GO
