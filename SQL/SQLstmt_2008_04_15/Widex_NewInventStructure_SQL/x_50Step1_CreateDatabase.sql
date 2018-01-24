CREATE DATABASE [widsql5_cit_udv] ON  PRIMARY 
( NAME = N'widsql5_cit_udv', FILENAME = N'G:\MSSQL\DATA\widsql5_cit_udv.mdf' , SIZE = 133120000KB , FILEGROWTH = 5120000KB )
 LOG ON 
( NAME = N'widsql5_cit_udv_log', FILENAME = N'D:\MSSQL\LOG\widsql5_cit_udv_log.ldf' , SIZE = 5120000KB , FILEGROWTH = 1024000KB )
GO
EXEC dbo.sp_dbcmptlevel @dbname=N'widsql5_cit_udv', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [widsql5_cit_udv].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [widsql5_cit_udv] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET ARITHABORT OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [widsql5_cit_udv] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET AUTO_UPDATE_STATISTICS OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [widsql5_cit_udv] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [widsql5_cit_udv] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [widsql5_cit_udv] SET  READ_WRITE 
GO
ALTER DATABASE [widsql5_cit_udv] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [widsql5_cit_udv] SET  MULTI_USER 
GO
ALTER DATABASE [widsql5_cit_udv] SET PAGE_VERIFY CHECKSUM  
GO
USE [widsql5_cit_udv]
GO
IF NOT EXISTS (SELECT name FROM sys.filegroups WHERE is_default=1 AND name = N'PRIMARY') 
	ALTER DATABASE [widsql5_cit_udv] MODIFY FILEGROUP [PRIMARY] DEFAULT
GO
