# SQl_questions_ankit_bansal
/*Here are the given datasets below:
-There are two tables named as source and target.
-SQL interview problem asked in PWC. We will solve it using 2 methods. Here is the script :
create table source(id int, name varchar(5));
create table target(id int, name varchar(5));
insert into source values(1,'A'),(2,'B'),(3,'C'),(4,'D');
insert into target values(1,'A'),(2,'B'),(4,'X'),(5,'F');
--output:
(id,comment)-(3,'new in source'),(5,'new in target'),(4,'mismatch')*/
"SOLUTION-1"
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
"SOLUTION -2"

with cte as 
    (
    SELECT 
        *,'source' as tab_name 
    FROM 
        SOURCE 
    UNION ALL 
        SELECT 
        *,'target' as tab_name 
    FROM TARGET)
    select 
    id,case 
          when min(tab_name)='source' then 'new in source' 
          when max(tab_name)='target' then 'new in target' 
          when max(tab_name)!=min(tab_name) then 'mismatch'  end as comment# SQl_questions_ankit_bansal
/*Here are the given datasets below:
-There are two tables named as source and target.
-SQL interview problem asked in PWC. We will solve it using 2 methods. Here is the script :
create table source(id int, name varchar(5));
create table target(id int, name varchar(5));
insert into source values(1,'A'),(2,'B'),(3,'C'),(4,'D');
insert into target values(1,'A'),(2,'B'),(4,'X'),(5,'F');
--output:
(id,comment)-(3,'new in source'),(5,'new in target'),(4,'mismatch')*/

--SOLUTION_1 using full outer join
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
--SOLUTION_2 using Union all

with cte as 
    (
    SELECT 
        *,'source' as tab_name 
    FROM 
        SOURCE 
    UNION ALL 
        SELECT 
        *,'target' as tab_name 
    FROM TARGET)
    select 
    id,case 
          when min(tab_name)='source' then 'new in source' 
          when max(tab_name)='target' then 'new in target' 
          when max(tab_name)!=min(tab_name) then 'mismatch'  end as comment
    from 
          cte
    group by 
          id 
    having 
        COUNT(*)=1 or (count(*)=2 and min(name)!=max(name))



   


