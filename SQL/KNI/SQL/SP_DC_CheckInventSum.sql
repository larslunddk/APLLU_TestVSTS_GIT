-- =============================================
-- Create basic stored procedure template
-- =============================================

-- Drop stored procedure if it already exists
IF EXISTS (
  SELECT * 
    FROM INFORMATION_SCHEMA.ROUTINES 
   WHERE SPECIFIC_SCHEMA = N'dbo'
     AND SPECIFIC_NAME = N'DC_CheckInventSum' 
)
   DROP PROCEDURE dbo.DC_CheckInventSum
GO

CREATE PROCEDURE dbo.DC_CheckInventSum
	(@ItemId		nvarchar(20), 
	@InventDimId nvarchar(20))
AS
	declare @IT_Sum numeric(28,12)
	declare @IS_Sum numeric(28,12)

	set @IT_SUM = (select sum(i.qty) from inventtrans i
					where i.itemid = @ItemId and i.inventdimid = @inventdimid
			        and i.statusissue <= 3 and i.statusreceipt <= 3)
	set @IS_SUM = (select top 1 postedqty+received-deducted-picked+registered from inventsum  
					where inventsum.itemid = @itemid and inventsum.inventdimid = @inventdimid)
	if (@IS_Sum <> @IT_Sum)
	begin
		insert into DC_TmpLogOnHand_211InventLocations
		select	getdate(), 
				(select inventlocationid from inventdim where inventdimid = @InventDimId), 
				@itemid, 
				@IS_Sum, 
				@IT_Sum
	end		        
GO

-- =============================================
-- Example to execute the stored procedure
-- =============================================
declare @InventDimId nvarchar(20)
select @InventDimId = right(replicate(' ',20)+'136',20)
EXECUTE dbo.DC_CheckInventSum '09180090003', @InventDimId
GO

