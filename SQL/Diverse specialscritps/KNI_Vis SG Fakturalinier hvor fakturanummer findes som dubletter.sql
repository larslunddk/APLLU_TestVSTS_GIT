begin tran
update DC_SGInvoiceHeader
	set DC_MoreInvPO = case (select count(*) from DC_SGInvoiceHeader IH where IH.POnumber_1 = DC_SGInvoiceHeader.POnumber_1)
					when 1 then 0
					else 1
					end
rollback tran