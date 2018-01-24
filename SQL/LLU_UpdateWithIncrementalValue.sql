declare @Cnt as int
set @Cnt = 0;
update dbo.custtable set @Cnt = @Cnt + 1,
						 telex = cast(@cnt as varchar(10));
go