Create Table Trade_tbl(
TRADE_ID varchar(20),
Trade_Timestamp time,
Trade_Stock varchar(20),
Quantity int,
Price Float
)

Insert into Trade_tbl Values('TRADE1','10:01:05','ITJunction4All',100,20)
Insert into Trade_tbl Values('TRADE2','10:01:06','ITJunction4All',20,15)
Insert into Trade_tbl Values('TRADE3','10:01:08','ITJunction4All',150,30)
Insert into Trade_tbl Values('TRADE4','10:01:09','ITJunction4All',300,32)
Insert into Trade_tbl Values('TRADE5','10:10:00','ITJunction4All',-100,19)
Insert into Trade_tbl Values('TRADE6','10:10:01','ITJunction4All',-300,19)



select t2.trade_id,t1.price,t2.price, 
abs(t2.price-t1.price)/t2.price*100.0 as price_percentage
from Trade_tbl as t1 
inner join Trade_tbl as t2 
ON 1=1
where t1.TRADE_ID!=t2.TRADE_ID and
datediff(second,t1.Trade_Timestamp,t2.trade_timestamp)<10
and abs(t2.price-t1.price)/t2.price*100.0>10.0










