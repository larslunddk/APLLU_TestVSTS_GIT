-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Lars Lund
-- Create date: 12-09-2014
-- Description:	
-- =============================================
CREATE FUNCTION AP_InvTransType 
(
	-- Add the parameters for the function here
	@InvTransTypeInt int
)
RETURNS nvarchar(40)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @InvTransTypeTxt nvarchar(40)

	SET @InvTransTypeTxt=(CASE @InvTransTypeInt when 0 then 'Sales' when 3 then 'purch' when 4 then 'inventtransaction' when 5 then 'inventlossprofit' when 6 then 'inventtransfer' when 13 then 'inventcounting' when 21 then 'TransferOrderShip' when 22 then 'TransferOrderReceive' when 150 then 'Statement' end)

	-- Return the result of the function
	RETURN @InvTransTypeTxt

END


