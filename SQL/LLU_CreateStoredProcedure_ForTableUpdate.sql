-- =============================================
-- Create procedure basic template
-- =============================================
-- creating the store procedure

IF EXISTS (SELECT name 
	   FROM   sysobjects 
	   WHERE  name = N'UpdateDEL_CONFIGID' 
	   AND 	  type = 'P')
    DROP PROCEDURE UpdateDEL_ConfigID
GO

CREATE PROCEDURE UpdateDEL_ConfigID 
	@NewVal varchar(49) = N'Blank'
AS
	Update bmssa.InventTrans set DEL_ConfigID=@NewVal
		--where ItemId = 'P5'
GO

-- =============================================
-- example to execute the store procedure
-- =============================================
Use axdb3_HCT1
EXECUTE UpdateDEL_ConfigID 'AAA'
GO

