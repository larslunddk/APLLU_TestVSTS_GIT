select * from ACCESSRIGHTSLIST A
where (A.groupid = 'tek')
AND   (A.accesstype = 0)
AND recid <> (select recid from ACCESSRIGHTSLIST B
		where 	(B.groupid = A.groupid)
		AND   	(B.domainid = A.domainid)
		AND	(B.recordtype = A.recordtype)
		AND	(B.parentid = A.parentid)
		AND	(B.[id]	= A.[id])
		AND	(B.recid <> A.recid) 
	      )
order by groupid, domainid, recordtype, parentid,[id]

select recid into tmptable from ACCESSRIGHTSLIST A
where (A.groupid = 'tek')
AND   (A.accesstype = 0)
AND recid <> (select recid from ACCESSRIGHTSLIST B
		where 	(B.groupid = A.groupid)
		AND   	(B.domainid = A.domainid)
		AND	(B.recordtype = A.recordtype)
		AND	(B.parentid = A.parentid)
		AND	(B.[id]	= A.[id])
		AND	(B.recid <> A.recid) 
	      )
order by groupid, domainid, recordtype, parentid,[id]
go
select * from tmptable
go
delete from ACCESSRIGHTSLIST
where recid IN (select recid from tmptable)
go
drop table tmptable