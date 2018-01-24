use ax40_kni_drift
select * into dbo.RCMSUPFOORDERREFERENCE_Backup from dbo.RCMSUPFOORDERREFERENCE
	where refpurchid = ''
	or  not exists (select * from purchtable where purchid = dbo.RCMSUPFOORDERREFERENCE.refpurchid)

delete from dbo.RCMSUPFOORDERREFERENCE
	where refpurchid = ''
	or  not exists (select * from purchtable where purchid = dbo.RCMSUPFOORDERREFERENCE.refpurchid)

use ax40_kni_copy
select * into dbo.RCMSUPFOORDERREFERENCE_Backup from dbo.RCMSUPFOORDERREFERENCE
	where refpurchid = ''
	or  not exists (select * from purchtable where purchid = dbo.RCMSUPFOORDERREFERENCE.refpurchid)

delete from dbo.RCMSUPFOORDERREFERENCE
	where refpurchid = ''
	or  not exists (select * from purchtable where purchid = dbo.RCMSUPFOORDERREFERENCE.refpurchid)