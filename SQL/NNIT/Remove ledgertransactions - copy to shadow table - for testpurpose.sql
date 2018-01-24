-- copy Ledgertrans to shadow table and remove ledgertrans
select * into ledgertrans_shadow from LEDGERTRANS
	where TRANSDATE<'20090101' and DATAAREAID = 'dk'
delete from LEDGERTRANS
	where TRANSDATE<'20090101' and DATAAREAID = 'dk'

--Reinsert ledgertrans from Ledgertrans_shadow table
insert into ledgertrans
select * from ledgertrans_shadow
	where TRANSDATE<'20090101' and DATAAREAID = 'dk'
drop table ledgertrans_shadow	

-- Count ledgertrans records	
select count(*) from LEDGERTRANS where TRANSDATE >= '20090101' and DATAAREAID = 'dk'
select count(*) from LEDGERTRANS where TRANSDATE < '20090101' and DATAAREAID = 'dk'