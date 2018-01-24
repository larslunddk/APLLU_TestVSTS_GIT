USE [AX40_KNI_DRIFT]
/*create view TmpLT
as select cast(AmountMST as dec(18,2)) as AmountMST, cast(AmountCur as dec(18,2)) as AmountCur, recidint as recid
	from axkni_move.dbo.tmp_ledgertrans
	where dataareaid = 'KNI'

GO
*/
declare @voucher varchar(20)
select @voucher = 'D_10178570'
BEGIN TRAN
/*select LT.AMOUNTMST, LT.AMOUNTCUR, cast(TmpLT.AMOUNTMST as dec(18,2)) as TmpLTAMOUNTMST, cast(TmpLT.AMOUNTCUR as dec(18,2)) as TmpLTAMOUNTCUR
	from [AX40_KNI_DRIFT].dbo.ledgertrans LT INNER JOIN axkni_move.dbo.tmp_ledgertrans TmpLT
	ON  LT.dataareaid = TmpLT.dataareaid
    and LT.recid = TmpLT.RECIDINT
	and LT.voucher = right(replicate(' ',20)+@Voucher,20)
	and LT.dataareaid = 'KNI'
*/


update [AX40_KNI_DRIFT].dbo.ledgertrans 
	set AMOUNTMST = dbo.TmpLT.AMOUNTMST ,
        AMOUNTCUR = dbo.TmpLT.AMOUNTCUR --dbo.AmountCURValue(RECID)
	from dbo.TmpLT
		where dbo.TmpLT.recid = dbo.ledgertrans.RecId
		--and dbo.ledgertrans.voucher = right(replicate(' ',20)+@Voucher,20)
		and dbo.ledgertrans.amountmst <> cast(dbo.ledgertrans.amountmst as dec(18,2))

/*
select LT.AMOUNTMST, LT.AMOUNTCUR, cast(TmpLT.AMOUNTMST as dec(18,2)) as TmpLTAMOUNTMST, cast(TmpLT.AMOUNTCUR as dec(18,2)) as TmpLTAMOUNTCUR
	from [AX40_KNI_DRIFT].dbo.ledgertrans LT INNER JOIN axkni_move.dbo.tmp_ledgertrans TmpLT
	ON  LT.dataareaid = TmpLT.dataareaid
    and LT.recid = TmpLT.RECIDINT
	and LT.voucher = right(replicate(' ',20)+@Voucher,20)
	and LT.dataareaid = 'KNI'
*/
COMMIT TRAN





