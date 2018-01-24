drop table tmp_LLU
drop table tmp_LLU2

SELECT     CONNECTIONID, PURCHID, count(*) as cnt
into tmp_LLU  
FROM         DC_PURCHPROPOSALLINE
group by CONNECTIONID, PURCHID

select purchid,count(*) as Ant_Forbindelser,
	(SELECT DC_SGSHIPPED FROM PURCHTABLE WHERE PURCHID = tmp_LLU.purchid) as SG_SHIPPED
into tmp_LLU2
 from tmp_LLU
group by purchid
order by Ant_Forbindelser desc

delete from tmp_LLU2 where Ant_Forbindelser < 2
delete from tmp_LLU2 where Ant_Forbindelser >= 32

select * from tmp_LLU2 order by SG_SHIPPED DESC, purchid

SELECT     PURCHLINE.PURCHID, PURCHLINE.ITEMID,  dbo.LP_YEAR_MTH_DATE(PURCHTABLE.DC_SGSHIPPED), 
					  PURCHTABLE.DC_CONNECTIONID AS Connection_IO, 
                      DC_PURCHPROPOSALLINE.CONNECTIONID AS Connection_IOF, 
					  dbo.LP_DECIMAL(PURCHLINE.QTYORDERED) AS QTY_IO, 
                      dbo.LP_DECIMAL(DC_PURCHPROPOSALLINE.QTY) AS QTY_IOF
FROM         PURCHLINE INNER JOIN
                      PURCHTABLE ON PURCHLINE.PURCHID = PURCHTABLE.PURCHID AND PURCHLINE.DATAAREAID = PURCHTABLE.DATAAREAID INNER JOIN
                      DC_PURCHPROPOSALLINE ON PURCHLINE.DATAAREAID = DC_PURCHPROPOSALLINE.DATAAREAID AND 
                      PURCHLINE.RECID = DC_PURCHPROPOSALLINE.REFPURCHRECID INNER JOIN
                      tmp_LLU2 ON PURCHTABLE.PURCHID = tmp_LLU2.purchid
where DC_PURCHPROPOSALLINE.CONNECTIONID <> PURCHTABLE.DC_CONNECTIONID
and PURCHTABLE.DC_SGSHIPPED > '20000101'
order by purchid
--select * from tmp_LLU where purchid = right(replicate(' ',20)+'70003200',20)
	
