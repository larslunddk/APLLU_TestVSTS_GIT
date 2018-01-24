USE [widsql3_cit_udv]
GO
/****** Object:  StoredProcedure [dbo].[TimeSec]    Script Date: 04/07/2008 12:56:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MOG
ALTER PROCEDURE [dbo].[TimeSec]
AS
BEGIN
	DECLARE @Res as int
	select @Res = DATEPART(HOUR, GETDATE()) * 3600 +	
			      DATEPART(MINUTE, GETDATE()) * 60 +
				  DATEPART(SECOND, GETDATE())

	
	--RETURN @Res

END
