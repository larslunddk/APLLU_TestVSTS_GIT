USE [widsql3_cit_udv]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF  EXISTS (SELECT * FROM sys.objects 
					WHERE object_id = OBJECT_ID(N'[dbo].[TimeSec]')
                      AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))        
	DROP FUNCTION [dbo].[TimeSec];
GO

-- =============================================
-- Author:		MOG, 04/07/2008
-- Function:	Return seconds since midnigth
-- =============================================
CREATE FUNCTION TimeSec()
	returns int AS
BEGIN
	DECLARE @Res as int
	select @Res = DATEPART(HOUR, GETDATE()) * 3600 +	
			      DATEPART(MINUTE, GETDATE()) * 60 +
				  DATEPART(SECOND, GETDATE())
	return @res
END
GO

select [dbo].[TimeSec]
GO
