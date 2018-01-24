/*select count(*) from inventitemgroup
	where dataareaid = 'wid'
*/
declare @statement as varchar(500)

--create view tmp as select * from inventitemgroup
declare 
while (select name FROM syscolumns WHERE id = object_id('inventitemgroup'))
begin
	SELECT @statement + @statement + ','+c
	select @statement = substring(@statement,2,999)
	select @statement

end


SELECT @statement + @statement + ','+c
select @statement = substring(@statement,2,999)
select @statement



