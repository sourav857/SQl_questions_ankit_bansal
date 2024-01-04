
--find total number of clocked hours be each employee (inside the office), flag -I means punch in and O means punch out. 
--Employee can do multiple punch in and punch out in a day. for each punch in there will be a punch out.

select * from clocked_hours;

create table clocked_hours(

	empd_id int,

	swipe time,

	flag char
)

insert into clocked_hours values

(11114,'08:30','I'),

(11114,'10:30','O'),

(11114,'11:30','I'),

(11114,'15:30','O'),

(11115,'09:30','I'),

(11115,'17:30','O');

--inner join 
with cte as 
(	
  	select 	
  		*,row_number() over(partition by empd_id,flag order by swipe )
  	as 
  		match 
	from 
		clocked_hours 
),
cte1 as 
	(
		select 
  			c1.empd_id,datediff(hour,c1.swipe,c2.swipe) 
		as 
 			time 
		from 
  			cte c1 
		inner join 
  			cte c2 
		on 1=1 
		where 
		c1.swipe!=c2.swipe 
  		and 
			c1.empd_id=c2.empd_id 
  		and 
			c1.match=c2.match
  	)
  select 
	empd_id,sum(time) 
  as 
	total_time 
  from 
	cte1 
  where 
	time>0 
  group by 
	empd_id


--- rank method

	with cte as 
	(
  	select 
      		*,rank() over(partition by empd_id,flag order by swipe) as rn 
    from clocked_hours
  	)
  ,
  cte1 AS
   (
  	select 
     		empd_id,max(swipe) as swipe_in,min(swipe) as swipe_out,
  			datediff(hour,min(swipe),max(swipe) ) as time
  	from 
     	cte 
    group by 
     	rn,empd_id
    )
    
    select 
    	empd_id,sum(time) 
    as 
    	total_time 
    from 
    	cte1 
    group by 
    	empd_id
    
---lead method
  
    WITH CTE AS 
    	( 
          select 
          *, lead(swipe,1) over(partition by empd_id order by swipe) 
          as next_swipe
    	  from clocked_hours
        )
 	select 
 	empd_id,sum(datediff(hour,swipe,next_swipe)) 
    as toal_punch_time 
    from cte
    where flag= 'I'
 	group by empd_id
    
    
    
    
   







