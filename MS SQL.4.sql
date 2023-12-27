create table namaste_python (
file_name varchar(25),
content varchar(200)
);

delete from namaste_python;
insert into namaste_python values ('python bootcamp1.txt','python for data analytics 0 to hero bootcamp starting on Jan 6th')
,('python bootcamp2.txt','classes will be held on weekends from 11am to 1 pm for 5-6 weeks')
,('python bootcamp3.txt','use code NY2024 to get 33 percent off. You can register from namaste sql website. Link in pinned comment')



select value,count(*) as count_of_word from string_split((select string_agg(content,' ') as name from namaste_python),' ') 
group by value
having COUNT(*)>1



select value,count(*) as count_of_words from namaste_python cross apply  string_split(content,' ') 
group by value
having count(*)>1













