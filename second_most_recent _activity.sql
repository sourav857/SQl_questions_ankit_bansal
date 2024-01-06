--Get second recent activity ,
--but return one of there is only one username


create table UserActivity
(
username      varchar(20) ,
activity      varchar(20),
startDate     Date   ,
endDate      Date
);
drop table UserActivity
insert into UserActivity values 
('Alice','Travel','2020-02-12','2020-02-20')
,('Alice','Dancing','2020-02-21','2020-02-23')
,('Alice','Travel','2020-02-24','2020-02-28')
,('Bob','Travel','2020-02-11','2020-02-18');

with cte as 
	(
    select *,count(*) 
	over(partition by username ) as total_activity,
      rank() over(partition by username order by startDate) as rn
      
     from UserActivity
     )
     select * from cte where total_activity=1 or rn=2
    
  


