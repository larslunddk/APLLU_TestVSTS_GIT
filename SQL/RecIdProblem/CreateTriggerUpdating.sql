-- ================================================
-- Template generated from Template Explorer using:
-- Create Trigger (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- See additional Create Trigger templates for more
-- examples of different Trigger statements.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER InsertRecId
   ON  dbo.inventtable
   AFTER INSERT
AS 
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
-- Insert statements for trigger here
	if (
	Declare @NewRecId   as INT
	declare @count		as INT
	BEGIN
		UPDATE dbo.SystemSequences
			SET    @NewRecid  = NextVal,
					NextVal    = NextVal + 1	--@Count
			WHERE ID = -1 AND TABID = 0 AND Dataareaid = 'dat'	
		
	END
    

END
GO
