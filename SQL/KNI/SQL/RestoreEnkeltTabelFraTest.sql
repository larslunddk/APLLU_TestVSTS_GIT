drop table TmpRCMItemDateValues
select * into TmpRCMItemDateValues from RCMItemDateValues

drop table RCMItemDateValues
select * into RCMItemDateValues from AX40_KNI_COPY.dbo.RCMItemDateValues


--select top 100 * from R,0CMItemDateValues