--solution-1 using full outer join
select 
	coalesce(s.id,t.id) as id,
    case 
    	when s.name!=t.name then 'mismatch'
    	when t.name is not null then 'new in source'
    	when s.name is not null then 'new in target' end as comment
from
	source s 
full outer join 
	target t
on 
	s.id=t.id 
where 
	s.name!=t.name or s.name is null or t.name is null;
--solution -2 using union all    
with cte as 
(
	SELECT
		*,'source' as tab_name
	FROM 
		SOURCE 
    	UNION ALL 
    	SELECT 
		*,'target' as tab_name 
	FROM 
	TARGET
)
    select 
	id,
	case 
	when min(tab_name)='source' then 'new in source' 
    	when max(tab_name)='target' then 'new in target' 
    	when max(tab_name)!=min(tab_name) then 'mismatch' 
    	end as comment
    --min(name) as n1,max(name) as n2,min(tab_name) as t1,max(tab_name) as t2,count(*) as count
    from 
	cte
    group by
	id 
    having 
	COUNT(*)=1 or (count(*)=2 and min(name)!=max(name))
    
    
    
    
