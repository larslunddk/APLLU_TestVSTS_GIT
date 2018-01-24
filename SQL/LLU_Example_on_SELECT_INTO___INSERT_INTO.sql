drop table inventitemlocationShadow

-- inventitemlocationShadow must be a NEW table
select * into inventitemlocationShadow from inventItemLocation
select count(*) from inventitemlocationShadow

-- inventitemlocationShadow is EXISTING table
insert into inventitemlocationShadow select * From inventItemLocation
select count(*) from inventitemlocationShadow