script:
Create table candidates(
id int primary key,
positions varchar(10) not null,
salary int not null);
drop table candidates
test case 1:
insert into candidates values(1,'junior',5000);
insert into candidates values(2,'junior',7000);
insert into candidates values(3,'junior',7000);
insert into candidates values(4,'senior',10000);
insert into candidates values(5,'senior',30000);
insert into candidates values(6,'senior',20000);

test case 2:
insert into candidates values(20,'junior',10000);
insert into candidates values(30,'senior',15000);
insert into candidates values(40,'senior',30000);

test case 3:
insert into candidates values(1,'junior',15000);
insert into candidates values(2,'junior',15000);
insert into candidates values(3,'junior',20000);
insert into candidates values(4,'senior',60000);

test case 4:
insert into candidates values(10,'junior',10000);
insert into candidates values(40,'junior',10000);
insert into candidates values(20,'senior',15000);
insert into candidates values(30,'senior',30000);
insert into candidates values(50,'senior',15000);

with cte as 
  
  (
    	select 
   		*,sum(salary) over(partition by positions order by salary,id)   
   		as
   		caps  
    	from
    	candidates),
  
  cte1 as 
  (
    select * 
    from cte 
    where 
    positions='senior' 
    and 
    caps<=50000
  ),
  cte2 as 
  (
 
 	 select 
    	* 
    from 
    	cte 
    where 
    	positions='junior'
  	and 
    caps <=50000-
    			(select coalesce(sum(salary),0) from cte1) union all 
    select 
    *
    from 
    cte1
 )
 	select 
    sum(case when positions='junior' then 1 else 0 end ) 
    as 
    junior
   ,sum(case when positions='senior' then 1 else 0 end) 
   as 
   senior 
   from 
   cte2

 





