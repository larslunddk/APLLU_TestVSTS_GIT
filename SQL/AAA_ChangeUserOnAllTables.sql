 sp_change_users_login auto_fix, 'bmssa'
 go
 select * from sysobjects
 exec sp_configure 'allow updates', 1
 reconfigure WITH OVERRIDE
 go

 Begin Transaction
   update systypes set uid = user_id('dbo')
   update sysobjects set uid = user_id('dbo')
 Commit Transaction

 exec sp_configure 'allow updates', 0
 reconfigure WITH OVERRIDE

 go
 sp_dropuser 'bmssa'
 go
 sp_changedbOwner 'bmssa'
 go
