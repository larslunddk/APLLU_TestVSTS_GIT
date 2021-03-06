USE [widsql3_cit_udv]
GO
/****** Object:  UserDefinedFunction [dbo].[TimeSec]    Script Date: 04/07/2008 12:00:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO 
-- =============================================
-- Author:		MOG
ALTER FUNCTION [dbo].[TimeSec]()
RETURNS smallint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Res as smallint

	-- Add the T-SQL statements to compute the return value here
	select @Res = DATEPART(HOUR, GETDATE()) * 3600 +	
			      DATEPART(MINUTE, GETDATE()) * 60 +
				  DATEPART(SECOND, GETDATE())

	
	RETURN @Res

END
