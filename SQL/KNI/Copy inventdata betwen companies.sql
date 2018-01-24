use AX40SP2_KNI_UDV

drop table InventTable_Tmp
select * into InventTable_Tmp from InventTable
update InventTable_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into InventTable select * From InventTable_Tmp

drop table InventTableModule_Tmp
select * into InventTableModule_Tmp from InventTableModule where dataareaid = 'KNI'
select count(*) From INventTableModule where dataareaid = 'RCM'
delete from InventTableModule where dataareaid = 'RCM'
update InventTableModule_Tmp set Dataareaid = 'RCM', RecId = RecID+10000000000000
	where dataareaid = 'KNI'
insert into InventTableModule select * From InventTableModule_Tmp

drop table RCMInventTable_Tmp
delete from RCMInventTable where dataareaid = 'RCM'
select * into RCMInventTable_Tmp from RCMInventTable where dataareaid = 'KNI'
update RCMInventTable_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into RCMInventTable select * From RCMInventTable_Tmp

drop table InventItemLocation_Tmp
delete from InventItemLocation where dataareaid = 'RCM'
select * into InventItemLocation_Tmp from InventItemLocation where dataareaid = 'KNI'
update InventItemLocation_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into InventItemLocation select * From InventItemLocation_Tmp

drop table RCMInventLocation_Tmp
delete from RCMInventLocation where dataareaid = 'RCM'
select * into RCMInventLocation_Tmp from RCMInventLocation where dataareaid = 'KNI'
update RCMInventLocation_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into RCMInventLocation select * From RCMInventLocation_Tmp

drop table InventItemGroup_Tmp
delete from InventItemGroup where dataareaid = 'RCM'
select * into InventItemGroup_Tmp from InventItemGroup where dataareaid = 'KNI'
update InventItemGroup_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into InventItemGroup select * From InventItemGroup_Tmp

drop table RCMInventItemGroupVirtual_Tmp
delete from RCMInventItemGroupVirtual where dataareaid = 'RCM'
select * into RCMInventItemGroupVirtual_Tmp from RCMInventItemGroupVirtual where dataareaid = 'KNI'
update RCMInventItemGroupVirtual_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into RCMInventItemGroupVirtual select * From RCMInventItemGroupVirtual_Tmp

drop table InventTxt_Tmp
delete from InventTxt where dataareaid = 'RCM'
select * into InventTxt_Tmp from InventTxt where dataareaid = 'KNI'
update InventTxt_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into InventTxt select * From InventTxt_Tmp

drop table InventDim_Tmp
delete from InventDim where dataareaid = 'RCM'
select * into InventDim_Tmp from InventDim where dataareaid = 'KNI'
update InventDim_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into InventDim select * From InventDim_Tmp


drop table InventItemBarcode_Tmp
delete from InventItemBarcode where dataareaid = 'RCM'
select * into InventItemBarcode_Tmp from InventItemBarcode where dataareaid = 'KNI'
update InventItemBarcode_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into InventItemBarcode select * From InventItemBarcode_Tmp

drop table RCMInventItemBarcode_Tmp
delete from RCMInventItemBarcode where dataareaid = 'RCM'
select * into RCMInventItemBarcode_Tmp from RCMInventItemBarcode where dataareaid = 'KNI'
update RCMInventItemBarcode_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into RCMInventItemBarcode select * From RCMInventItemBarcode_Tmp

drop table RCMInventItemGroup_Tmp
delete from RCMInventItemGroup where dataareaid = 'RCM'
select * into RCMInventItemGroup_Tmp from RCMInventItemGroup where dataareaid = 'KNI'
update RCMInventItemGroup_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into RCMInventItemGroup select * From RCMInventItemGroup_Tmp

drop table RCMINVENTTABLEDATAAREASPEC_Tmp
delete from RCMINVENTTABLEDATAAREASPEC where dataareaid = 'RCM'
select * into RCMINVENTTABLEDATAAREASPEC_Tmp from RCMINVENTTABLEDATAAREASPEC where dataareaid = 'KNI'
update RCMINVENTTABLEDATAAREASPEC_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into RCMINVENTTABLEDATAAREASPEC select * From RCMINVENTTABLEDATAAREASPEC_Tmp
update RCMINVENTTABLEDATAAREASPEC set companyId = dataareaid where dataareaid = 'RCM'

drop table RCMInventItemGroup_Tmp
delete from RCMInventItemGroup where dataareaid = 'RCM'
select * into RCMInventItemGroup_Tmp from RCMInventItemGroup where dataareaid = 'KNI'
update RCMInventItemGroup_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into RCMInventItemGroup select * From RCMInventItemGroup_Tmp

drop table PriceDiscTable_Tmp
delete from PriceDiscTable where dataareaid = 'RCM'
select * into PriceDiscTable_Tmp from PriceDiscTable where dataareaid = 'KNI'
update PriceDiscTable_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into PriceDiscTable select * From PriceDiscTable_Tmp


drop table PriceDiscGroup_Tmp
delete from PriceDiscGroup where dataareaid = 'RCM'
select * into PriceDiscGroup_Tmp from PriceDiscGroup where dataareaid = 'KNI'
update PriceDiscGroup_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into PriceDiscGroup select * From PriceDiscGroup_Tmp

drop table PriceParameters_Tmp
delete from PriceParameters where dataareaid = 'RCM'
select * into PriceParameters_Tmp from PriceParameters where dataareaid = 'KNI'
update PriceParameters_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into PriceParameters select * From PriceParameters_Tmp

drop table DC_InventUNCodeTable_Tmp
delete from DC_InventUNCodeTable where dataareaid = 'RCM'
select * into DC_InventUNCodeTable_Tmp from DC_InventUNCodeTable where dataareaid = 'KNI'
update DC_InventUNCodeTable_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into DC_InventUNCodeTable select * From DC_InventUNCodeTable_Tmp

drop table DC_InventAssortmentTable_Tmp
delete from DC_InventAssortmentTable where dataareaid = 'RCM'
select * into DC_InventAssortmentTable_Tmp from DC_InventAssortmentTable where dataareaid = 'KNI'
update DC_InventAssortmentTable_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into DC_InventAssortmentTable select * From DC_InventAssortmentTable_Tmp

drop table DC_InventCategoryTable_Tmp
delete from DC_InventCategoryTable where dataareaid = 'RCM'
select * into DC_InventCategoryTable_Tmp from DC_InventCategoryTable where dataareaid = 'KNI'
update DC_InventCategoryTable_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into DC_InventCategoryTable select * From DC_InventCategoryTable_Tmp

drop table DC_InventPackingCodeTable_Tmp
delete from DC_InventPackingCodeTable where dataareaid = 'RCM'
select * into DC_InventPackingCodeTable_Tmp from DC_InventPackingCodeTable where dataareaid = 'KNI'
update DC_InventPackingCodeTable_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into DC_InventPackingCodeTable select * From DC_InventPackingCodeTable_Tmp

drop table Unit_Tmp
delete from Unit where dataareaid = 'RCM'
select * into Unit_Tmp from Unit where dataareaid = 'KNI'
update Unit_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into Unit select * From Unit_Tmp

drop table DC_InventCalcGroupTable_Tmp
delete from DC_InventCalcGroupTable where dataareaid = 'RCM'
select * into DC_InventCalcGroupTable_Tmp from DC_InventCalcGroupTable where dataareaid = 'KNI'
update DC_InventCalcGroupTable_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into DC_InventCalcGroupTable select * From DC_InventCalcGroupTable_Tmp

drop table DC_SignCodeTable_Tmp
delete from DC_SignCodeTable where dataareaid = 'RCM'
select * into DC_SignCodeTable_Tmp from DC_SignCodeTable where dataareaid = 'KNI'
update DC_SignCodeTable_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into DC_SignCodeTable select * From DC_SignCodeTable_Tmp

drop table DC_MixMatchTable_Tmp
delete from DC_MixMatchTable where dataareaid = 'RCM'
select * into DC_MixMatchTable_Tmp from DC_MixMatchTable where dataareaid = 'KNI'
update DC_MixMatchTable_Tmp set Dataareaid = 'RCM', RecId = RecID+1000000000000
	where dataareaid = 'KNI'
insert into DC_MixMatchTable select * From DC_MixMatchTable_Tmp


drop table InventTable_Tmp
drop table InventTableModule_Tmp
drop table RCMInventTable_Tmp
drop table InventItemLocation_Tmp
drop table RCMInventLocation_Tmp
drop table InventItemGroup_Tmp
drop table RCMInventItemGroupVirtual_Tmp
drop table InventTxt_Tmp
drop table InventDim_Tmp
drop table InventItemBarcode_Tmp
drop table RCMInventItemBarcode_Tmp
drop table RCMInventItemGroup_Tmp
drop table RCMINVENTTABLEDATAAREASPEC_Tmp
drop table RCMInventItemGroup_Tmp
drop table PriceDiscTable_Tmp
drop table PriceDiscGroup_Tmp
drop table PriceParameters_Tmp
drop table DC_InventUNCodeTable_Tmp
drop table DC_InventAssortmentTable_Tmp
drop table DC_InventCategoryTable_Tmp
drop table DC_InventPackingCodeTable_Tmp
drop table Unit_Tmp
drop table DC_InventCalcGroupTable_Tmp
drop table DC_SignCodeTable_Tmp
drop table DC_MixMatchTable_Tmp