--################### LLU Helper jobs


-- Show blocked sessions
select cmd,* from sys.sysprocesses
where blocked > 0

-- Show sessions running on a specific AOS
select * from batch 
where STARTDATETIME>'20170421'
and status =2
and serverid = '01@AXPRODAOS24'
--group by [STATUS]

