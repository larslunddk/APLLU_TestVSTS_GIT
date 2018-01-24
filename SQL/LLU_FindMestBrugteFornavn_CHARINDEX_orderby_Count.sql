select count(*) as Cnt,substring(name,1,charindex(' ',name)-1) as FirstName from custTable
where charindex(' ',name)>1
group by substring(name,1,charindex(' ',name)-1)
order by Cnt DESC
