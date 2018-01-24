select sortingid, count(*) from bmssa.ProjTable group by sortingid

update bmssa.projtable set sortingid2_ = cast(Year(CREATED) as varchar(4)) + '-' + 
									     case 
										 when Month(CREATED) <10 then '0'+cast(Month(CREATED) as varchar(2))
																 else cast(Month(CREATED) as varchar(2))
										 end
go
select sortingid, count(*) from bmssa.ProjTable group by sortingid order by sortingid
select sortingid2_, count(*) from bmssa.ProjTable group by sortingid2_ order by sortingid2_

select count(*) from bmssa.PROJCERTIFICATE

select distinct fortstatus from bmssa.PROJCERTIFICATE
select distinct fortstatus from bmssa.PROJMATERIEL

drop view ULCertificateView
create view ULCertificateView as 
SELECT     bmssa.PROJCERTIFICATE.ITEMID, bmssa.PROJCERTIFICATE.CERTTYPE, bmssa.PROJCERTIFICATE.PROJCERT_ENECGRCODE, 
                      bmssa.PROJMATERIEL.MATERIELID, bmssa.PROJMATERIEL.FORTSTATUS, bmssa.PROJDECISION.DECISIONID,  
                      bmssa.PROJDECISION.EXPIREDATE, bmssa.CUSTTABLE.NAME, bmssa.CUSTTABLE.ACCOUNTNUM, bmssa.PROJTABLE.PROJID, bmssa.PROJTABLE.SORTINGID, 
                      bmssa.PROJTABLE.SORTINGID2_, 1 AS cnt
FROM         bmssa.PROJTABLE INNER JOIN
                      bmssa.PROJCERTIFICATE ON bmssa.PROJTABLE.PROJID = bmssa.PROJCERTIFICATE.PROJID INNER JOIN
                      bmssa.CUSTTABLE ON bmssa.PROJTABLE.CUSTACCOUNT = bmssa.CUSTTABLE.ACCOUNTNUM LEFT OUTER JOIN
                      bmssa.PROJDECISION INNER JOIN
                      bmssa.PROJDECISIONLINK ON bmssa.PROJDECISION.DECISIONID = bmssa.PROJDECISIONLINK.DECISIONID ON 
                      bmssa.PROJCERTIFICATE.PROJID = bmssa.PROJDECISIONLINK.PROJID LEFT OUTER JOIN
                      bmssa.PROJMATERIEL ON bmssa.PROJCERTIFICATE.PROJID = bmssa.PROJMATERIEL.PROJID
GROUP BY bmssa.PROJCERTIFICATE.ITEMID, bmssa.PROJCERTIFICATE.CERTTYPE, bmssa.PROJCERTIFICATE.PROJCERT_ENECGRCODE, 
                      bmssa.PROJMATERIEL.MATERIELID, bmssa.PROJMATERIEL.FORTSTATUS, bmssa.PROJDECISION.DECISIONID, bmssa.PROJDECISION.EXPIREDATE, 
                      bmssa.CUSTTABLE.NAME, bmssa.CUSTTABLE.ACCOUNTNUM, bmssa.PROJTABLE.PROJID, bmssa.PROJTABLE.SORTINGID, bmssa.PROJTABLE.SORTINGID2_