

/****** Object:  UserDefinedFunction [dbo].[LP_StatusReceipt]    Script Date: 04/05/2009 18:09:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[LP_StatusReceipt](@StatusReceipt int)
				Returns varchar(30) AS
BEGIN
	DECLARE @Out varchar(30)
	if (@StatusReceipt = 0) select @Out = 'none'
	if (@StatusReceipt = 1) select @Out = 'Purchased'
	if (@StatusReceipt = 2) select @Out = 'Received'
	if (@StatusReceipt = 3) select @Out = 'Registered'
	if (@StatusReceipt = 4) select @Out = 'Arrived'
	if (@StatusReceipt = 5) select @Out = 'Ordered'
	if (@StatusReceipt = 6) select @Out = 'QuotationReceipt'
    Return @Out;
END

GO


