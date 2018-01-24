select count(*) from inventtrans
	where inventtransid <= 5000000
	and   dataareaid = 'wid'

select count(*) from inventtrans
	where inventtransid > 5000000
	and   inventtransid <= 10000000
	and   dataareaid = 'wid'

select count(*) from inventtrans
	where inventtransid > 10000000
	and   inventtransid <= 15000000
	and   dataareaid = 'wid'

select count(*) from inventtrans
	where inventtransid > 15000000
	and   inventtransid <= 20000000
	and   dataareaid = 'wid'

select count(*) from inventtrans
	where inventtransid > 20000000
	
	and   dataareaid = 'wid'
