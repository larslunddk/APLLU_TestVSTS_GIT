select  tabid, fieldid, sqlname, (select sqlname from CU12 cu12Table where cu12Table.fieldid = '0' and CU12Table.tabid = CU12.tabid) as TableName_calc from CU12
where not exists (select 1 from CU8 where CU8.fieldId = CU12.fieldId and CU8.tabId = CU12.tabId and CU8.sqlName = CU12.sqlName)
order by tabid, fieldId

select  tabid, fieldid, sqlname, (select sqlname from CU8 cu8Table where CU8Table.fieldid = '0' and CU8Table.tabid = CU8.tabid) as TableName_calc from CU8
where not exists (select 1 from CU12 where CU12.fieldId = CU8.fieldId and CU12.tabId = CU8.tabId and CU12.sqlName = CU8.sqlName)
order by tabid, fieldId