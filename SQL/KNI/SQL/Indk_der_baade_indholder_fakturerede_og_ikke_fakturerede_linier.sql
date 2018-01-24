-- Indkøb hvor der både er fakturaopdaterede og ikke fakturaopdaterede linier - pr. kreditor
-- 
select purchid from purchtable
	where invoiceaccount = right(replicate(' ',20)+'8295',20)  --and purchid = right(replicate(' ',20)+'60200162',20)
and
exists (select 1 from purchline where purchid = PurchTable.purchid and purchstatus <> 3) 
and
exists (select 1 from purchline where purchid = PurchTable.purchid and purchstatus = 3)

