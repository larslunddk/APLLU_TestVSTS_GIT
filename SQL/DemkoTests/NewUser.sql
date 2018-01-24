use axdb_demko
exec sp_droplogin 'UL_Login'
exec sp_dropuser 'UL_User'
exec sp_addlogin 'UL_Login',@passwd = 'UL',@defdb = 'axdb_demko'
exec sp_adduser 'UL_Login','UL_User'
--EXEC sp_addrolemember N'db_datareader', N'UL_User'
GRANT connect to UL_User
GRANT SELECT ON OBJECT::dbo.ULCertificateView2 TO UL_User;


