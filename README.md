PWC_sql interview question

create table source(id int, name varchar(5));

create table target(id int, name varchar(5));

insert into source values(1,'A'),(2,'B'),(3,'C'),(4,'D');

insert into target values(1,'A'),(2,'B'),(4,'X'),(5,'F');

output-
-(id,comment)

-(3,'new in source'),(4,'mismatch')(5,'new in target')
