/*
select inventsum.itemid, inventsum.postedqty, inventsum.deducted, inventsum.received, inventsum.picked, inventsum.registered 
	from inventsum
	where inventsum.itemid = '1501003' and inventsum.inventdimid = 136
update inventsum set deducted = 0 where inventsum.itemid = '1501003' and inventsum.inventdimid = 136
select inventsum.itemid, inventsum.postedqty, inventsum.deducted, inventsum.received, inventsum.picked, inventsum.registered 
	from inventsum
	where inventsum.itemid = '1501003' and inventsum.inventdimid = 136
*/
select left(cast(dateCreated as nvarchar(30)),17),count(*) from DC_TmpLogOnHand_211InventLocations group by left(cast(dateCreated as nvarchar(30)),17) order by left(cast(dateCreated as nvarchar(30)),17)
select left(cast(dateCreated as nvarchar(30)),17),inventlocationid, count(*) from DC_TmpLogOnHand_211InventLocations group by left(cast(dateCreated as nvarchar(30)),17),inventlocationid order by left(cast(dateCreated as nvarchar(30)),17),inventlocationid

select itemid, count(*)  

select itemid
	from DC_TmpLogOnHand_211InventLocations 
	where left(cast(dateCreated as nvarchar(30)),17) = 'Apr 22 2009  8:54' group by itemid --itemid = '1501003' 
--delete from DC_TmpLogOnHand_211InventLocations where left(cast(dateCreated as nvarchar(30)),17) = 'Apr 17 2009  1:01'

