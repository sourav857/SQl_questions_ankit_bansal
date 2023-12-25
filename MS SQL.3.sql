/*CREATE TABLE subscriber (
 sms_date date ,
 sender varchar(20) ,
 receiver varchar(20) ,
 sms_no int
);
-- insert some values
INSERT INTO subscriber VALUES ('2020-4-1', 'Avinash', 'Vibhor',10);
INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Avinash',20);
INSERT INTO subscriber VALUES ('2020-4-1', 'Avinash', 'Pawan',30);
INSERT INTO subscriber VALUES ('2020-4-1', 'Pawan', 'Avinash',20);
INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Pawan',5);
INSERT INTO subscriber VALUES ('2020-4-1', 'Pawan', 'Vibhor',8);
INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Deepak',50);

-Find total number of messages exchanges between each person per day
*/
with 
cte as (
	select *,
	case when sender<receiver then sender else receiver end as s1,
 	case when sender>receiver then sender else receiver end as s2
	from subscriber 
	)
select 
	sms_date,s1,s2,sum(sms_no) 
as 
	messages_sent 
from 
	cte 
group BY 
	sms_date,s1,s2




