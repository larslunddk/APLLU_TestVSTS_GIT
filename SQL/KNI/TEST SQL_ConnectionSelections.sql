declare @RowCount INT
exec RCMSUPFODCGetConnectionIdsPaged_NEW 'KNI','KNI','020215','5701007011116','',20,1,'DC_ConnectionId','ASC',0,@Rowcount
exec RCMSUPFODCGetConnectionIds_NEW 'KNI','KNI','020215','5701007011116',0


--select top 100 * from dbo.DC_StoreBarcodeItemView 
--	where storeid = right(replicate(' ',20)+'020215',20)
--	and   storebarcode = '5701007011116'
	
 