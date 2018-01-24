SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		MOG
CREATE FUNCTION TimeSec
(
	
)
RETURNS smallint
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Res as smallint

	-- Add the T-SQL statements to compute the return value here
	@Res = SELECT DATEPART(HOUR, GETDATE())

	RETURN @Res

END
GO

