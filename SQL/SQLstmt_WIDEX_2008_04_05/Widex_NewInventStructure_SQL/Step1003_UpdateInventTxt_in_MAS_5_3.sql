SELECT     TOP (100) INVENTDIMCOMBINATION.ITEMID, INVENTDIMCOMBINATION.INVENTDIMID_WDX, INVENTDIMCOMBINATION.DATAAREAID, 
                      999999999 AS RECID
FROM         INVENTDIMCOMBINATION INNER JOIN
                      LANGUAGETXT ON INVENTDIMCOMBINATION.DATAAREAID = LANGUAGETXT.DATAAREAID AND 
                      INVENTDIMCOMBINATION.RECID = LANGUAGETXT.TXTRECID
WHERE     (INVENTDIMCOMBINATION.DATAAREAID = 'MAS') AND (LANGUAGETXT.TXTTABLEID = 1626)

select top 10 * from INVENTDIMCOMBINATION where DATAAREAID = 'MAS' 
	and exists (select recid from inventtable it 
					where it.itemid = inventdimcombination.itemid
					and   it.dataareaid = inventdimcombination.dataareaid
					and   it.itemidmaster <> '') 

select top 10 * from LANGUAGETXT where LANGUAGETXT.TXTTABLEID = 1626 and DATAAREAID = 'MAS'

	AND NOT EXISTS(select recid from inventtxt where 