--select * into DC_PURCHPROPOSALLINE from devsql.[AX40SP2_KNI_UDV2].dbo.[DC_PURCHPROPOSALLINE]
select * into INVENTTRANS from devsql.[AX40SP2_KNI_UDV2].dbo.INVENTTRANS
select * into INVENTDIM from devsql.[AX40SP2_KNI_UDV2].dbo.INVENTDIM
select * into PURCHTABLE from devsql.[AX40SP2_KNI_UDV2].dbo.PURCHTABLE
select * into PURCHLINE from devsql.[AX40SP2_KNI_UDV2].dbo.PURCHLINE
select * into VENDTABLE from devsql.[AX40SP2_KNI_UDV2].dbo.VENDTABLE
select * into INVENTITEMGROUP from devsql.[AX40SP2_KNI_UDV2].dbo.INVENTITEMGROUP
--select * into VENDTABLE from devsql.[AX40SP2_KNI_UDV2].dbo.VENDTABLE
select * into INVENTTABLE from devsql.[AX40SP2_KNI_UDV2].dbo.INVENTTABLE
select * into DC_PURCHCONNECTIONTABLE from devsql.[AX40SP2_KNI_UDV2].dbo.DC_PURCHCONNECTIONTABLE
select * into DC_PURCHCONNECTIONLINE from devsql.[AX40SP2_KNI_UDV2].dbo.DC_PURCHCONNECTIONLINE
select * into VENDINVOICEJOUR from devsql.[AX40SP2_KNI_UDV2].dbo.VENDINVOICEJOUR
select * into VENDINVOICETRANS from devsql.[AX40SP2_KNI_UDV2].dbo.VENDINVOICETRANS

/*
EXEC master.dbo.sp_configure 'show advanced options', 1
RECONFIGURE
EXEC master.dbo.sp_configure 'xp_cmdshell', 1
RECONFIGURE 

EXEC xp_cmdshell 'bcp "SELECT * FROM AX40SP2_KNI_UDV2.dbo.DC_PURCHPROPOSALLINE" queryout "C:\DC_PURCHPROPOSALLINE.txt" -T -c -t§' 
*/
