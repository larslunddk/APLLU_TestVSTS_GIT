Declare @FromDate as smalldatetime,
		@PCS_TRSID as varchar(20),
		@LATESTDATECUST as smalldatetime, 
		@LATESTDATEPCS as smalldatetime,  
		@PCS_USER_DESC as varchar(127),
		@MaxTRS as varchar(127),
		@tst as varchar(20)
		

select  @FromDate = CAST('2007-08-01' AS smalldatetime)


Declare PCS_TRSReport CURSOR FOR
	select PCS_TRSID, LATESTDATECUST, LATESTDATEPCS,  PCS_USER_DESC 
		from dbo.PCS_TRSReport 
		where LATESTDATECUST >= @FromDate
		order by LATESTDATECUST
OPEN PCS_TRSReport
FETCH NEXT FROM PCS_TRSReport into @PCS_TRSID,@LATESTDATECUST,@LATESTDATEPCS,@PCS_USER_DESC

WHILE @@FETCH_STATUS = 0
BEGIN
	select @maxtrs = '1'
	if @MaxTRS < @PCS_TRSID
	begin
		select @MaxTRS = @PCS_TRSID	
	end		

   -- This is executed as long as the previous fetch succeeds.
   FETCH NEXT FROM PCS_TRSReport into @PCS_TRSID,@LATESTDATECUST,@LATESTDATEPCS,@PCS_USER_DESC
END

CLOSE PCS_TRSReport
DEALLOCATE PCS_TRSReport

--print 'TRS '+@PCS_TRSID
print 'MAXTRS : '+@PCS_TRSID 
print '>' + @MaxTRS
print '   x' 

GO