
/*
create table products
(
product_id varchar(20) ,
cost int
);
insert into products values ('P1',200),('P2',300),('P3',500),('P4',800);

create table customer_budget
(
customer_id int,
budget int
);

insert into customer_budget values (100,400),(200,800),(300,1500);
*/





with cte as 
(
select *,sum(cost) over(order by cost) as cum_sum 
from products 
  )
select customer_id,count(*) as counting,string_agg(product_id,',') as number_of_products from customer_budget cb 
left join cte c ON
c.cum_sum<cb.budget
group by customer_id







  
   













